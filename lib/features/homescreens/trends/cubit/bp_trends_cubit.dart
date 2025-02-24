import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/features/homescreens/home/bp_record/get_bp_record_list_use_case/get_bp_record_list_use_case.dart';
import 'package:well_path/features/homescreens/home/bp_record/models/bp_record_paginator.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/response/bp_response.dart';
import 'package:well_path/features/homescreens/trends/models/bp_trends_state.dart';
import 'package:well_path/features/homescreens/trends/network/request/bp_category_details_request.dart';
import 'package:well_path/features/homescreens/trends/network/request/bp_export_graph_request.dart';
import 'package:well_path/features/homescreens/trends/network/request/bp_trends_line_graph_request.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_line_graph_domain_model.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_line_graph_response.dart';
import 'package:well_path/features/homescreens/trends/use_cases/bp_category_details_use_case/bp_category_details_use_case.dart';
import 'package:well_path/features/homescreens/trends/use_cases/bp_trends_line_graph_use_case/bp_trends_line_graph_use_case.dart';
import 'package:well_path/features/homescreens/trends/use_cases/csv_report_downlaod_use_case/csv_report_downlaod_use_case.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';
import 'package:well_path/helper/logger/logger.dart';
import 'package:well_path/helper/utils/file_utils.dart';
import 'package:open_file/open_file.dart';

class BPTrendsCubit extends Cubit<BPTrendState> {
  BPTrendsCubit(this._bpTrendsLineGraphUseCase, this._bpCategoryDetailsUseCase,
      this._getBpRecordListUseCase, this._donwloadCSVReportUseCase)
      : super(const BPTrendState());

  final BPTrendsLineGraphUseCase _bpTrendsLineGraphUseCase;
  final BPCategoryDetailsUseCase _bpCategoryDetailsUseCase;
  final GetBpRecordListUseCaseNew _getBpRecordListUseCase;
  final DonwloadCSVReportUseCase _donwloadCSVReportUseCase;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  BPTrendState _bpTrendState = const BPTrendState();

  Map<DateTime, List<BPTrendLineGraphUiModel>> get filteredData {
    return groupBy(state.bloodPressureList, (item) => item.date);
  }

  Map<DateTime, List<BPTrendLineGraphUiModel>> get filteredYearData {
    return groupBy(state.bloodPressureList, (item) => item.dateWithYear);
  }

  void imageException(error) {
    _message.add(CubitMessage.network(message: error.toString()));
  }

  Future<void> getBPGraphData(
      BloodPressureTrendsLineGraphRequest request) async {
    _loader.sink.add(true);

    final response = await _bpTrendsLineGraphUseCase(request);

    _loader.sink.add(false);

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final bpTrendsLineGraphResponse =
          response.asValue!.value.lineChartData?.map((e) => e.toDomain());
      final barChartResponse = response.asValue!.value.barChartData;
      _bpTrendState = state.copyWith(
          bloodPressureList: bpTrendsLineGraphResponse!.toList(),
          bpTrendsBarChartListItem: barChartResponse!.toList());

      // _navigation.sink.add(PhysicalActivityNavigation.food);
      return emit(_bpTrendState);
    }
  }

  Future<void> getBPCategoryDetails(
      BloodPressureCategoryDetailRequest request) async {
    _loader.sink.add(true);

    final response = await _bpCategoryDetailsUseCase(request);

    _loader.sink.add(false);

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final data = response.asValue!.value.data?.map((e) => e.toDomain());
      _bpTrendState = state.copyWith(bpCategoryDetailList: data!.toList());

      //  _navigation.sink.add(PhysicalActivityNavigation.food);
      return emit(_bpTrendState);
    }
  }

  Future<void> getBpRecordList(BpRecordPaginator bpRecordPaginator) async {
    _loader.sink.add(true);
    final response = await _getBpRecordListUseCase(bpRecordPaginator);
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        List<BpResponse> newBpResponse = [];
        final bpListResponse = response.asValue!.value;
        bpListResponse.bloodPressureList.forEach((element) {
          newBpResponse.add(element);
        });
        _bpTrendState = state.copyWith(
            bpResponseList: newBpResponse,
            isLoading: false,
            isShowDialogAlertBp: false);
        _loader.sink.add(false);
        return emit(_bpTrendState);
      }
    } catch (e) {
      _loader.sink.add(false);
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  Future<void> getBpRecordListTwo(BpRecordPaginator bpRecordPaginator) async {
    debugPrint(" page number " + bpRecordPaginator.offset.toString());

    final response = await _getBpRecordListUseCase(bpRecordPaginator);
    //  _enableNext();
    try {
      if (response.isError) {
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        List<BpResponse> newBpResponse = [];

        state.bpResponseList.forEach((element) {
          newBpResponse.add(element);
        });

        final bpListResponse = response.asValue!.value;

        bpListResponse.bloodPressureList.forEach((element) {
          newBpResponse.add(element);
        });

        _bpTrendState = state.copyWith(
          bpResponseList: newBpResponse,
          isLoading: false,
        );
        return emit(_bpTrendState);
      }
    } catch (e) {
      _loader.sink.add(false);
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  Future<void> downloadCSVReport(
      BloodPressureExportGraphRequest request) async {
    _loader.sink.add(true);
    // debugPrint(image);
    // final request = BloodPressureExportGraphRequest(image: image);
    final response = await _donwloadCSVReportUseCase(request);

    // _loader.sink.add(false);

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final url = response.asValue!.value.url;
      Logger.i('CSV REPORT URL $url');

      // final downloadededImage = await FileUtils.download(url);

      FileUtils.downloadFile(url, (filePath) {
        Logger.i('CSV REPORT Local Path $filePath');
        _loader.sink.add(false);
        OpenFile.open(filePath);
      }, () {
        Logger.i('Error TO Download the file from $url');
      });
      // Logger.i('CSV REPORT Local Path $downloadededImage');
      // _navigation.sink.add(PhysicalActivityNavigation.food);
      return emit(_bpTrendState);
    }
  }

  void isAdded(bool isAdded) {
    emit(state.copyWith(isAdded: isAdded));
  }

  void isLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  String getDate(String input) {
    DateTime dateTime = DateTime.parse(input).toLocal();
    // Format for date "12-04-2023"
    String formattedDate = DateFormat("MM/dd/yyyy").format(dateTime);
    return formattedDate;
  }

  String getTime(String input) {
    DateTime dateTime = DateTime.parse(input).toLocal();
    String formattedTime = DateFormat("hh:mm a").format(dateTime);
    return formattedTime;
  }

  void openBox(int index) {
    List<BpResponse> newList = [];
    for (int i = 0; i < state.bpResponseList.length; i++) {
      newList.add(BpResponse(
          categoryBP: state.bpResponseList[i].categoryBP,
          title: state.bpResponseList[i].title,
          type: state.bpResponseList[i].type,
          description: state.bpResponseList[i].description,
          userId: state.bpResponseList[i].userId,
          id: state.bpResponseList[i].id,
          systolicBP: state.bpResponseList[i].systolicBP,
          diastolicBP: state.bpResponseList[i].diastolicBP,
          pulse: state.bpResponseList[i].pulse,
          createdAt: state.bpResponseList[i].createdAt,
          isVisible: i == index ? !state.bpResponseList[i].isVisible : false));
    }
    emit(state.copyWith(bpResponseList: newList));
  }

  @override
  Future<void> close() {
    // TODO: implement close
    _message.close();
    _loader.close();
    return super.close();
  }
}
