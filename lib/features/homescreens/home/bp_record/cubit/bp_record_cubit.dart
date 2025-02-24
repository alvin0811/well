import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/homescreens/home/bp_record/bp_record_line_graph_use_case/bp_record_line_graph_use_case.dart';
import 'package:well_path/features/homescreens/home/bp_record/bp_record_use_case/bp_record_use_case.dart';
import 'package:well_path/features/homescreens/home/bp_record/get_bp_record_list_use_case/get_bp_record_list_use_case.dart';
import 'package:well_path/features/homescreens/home/bp_record/models/alert_bp_model.dart';
import 'package:well_path/features/homescreens/home/bp_record/models/bp_record_paginator.dart';
import 'package:well_path/features/homescreens/home/bp_record/models/bp_record_state.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/request/bp_request.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/response/bp_response.dart';
import 'package:well_path/features/homescreens/home/bp_record/selected_bp_item_use_case/selected_bp_item_use_case.dart';
import 'package:well_path/features/homescreens/trends/network/request/bp_trends_line_graph_request.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_line_graph_domain_model.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_line_graph_response.dart';
import 'package:well_path/features/settings/health_facts/models/data_initialization_home.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class BpRecordCubit extends Cubit<BpRecordState> {
  BpRecordCubit(this._bpRecordLineGraphUseCase, this._getBpRecordListUseCase,
      this._bpRecordUseCase, this._getSelectedItemUseCase, this.authStore)
      : super(const BpRecordState());

  final BPRecordLineGraphUseCase _bpRecordLineGraphUseCase;
  final GetBpRecordListUseCase _getBpRecordListUseCase;
  final BpRecordUseCase _bpRecordUseCase;
  final GetSelectedItemUseCase _getSelectedItemUseCase;
  final AuthStore authStore;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _openDialog = SController<bool>.broadcast();
  S<bool> get openDialog => _openDialog.stream;

  BpRecordState _bpRecordState = const BpRecordState();

  Map<DateTime, List<BPTrendLineGraphUiModel>> get filteredData {
    return groupBy(state.bloodPressureList, (item) => item.date);
  }

  Map<DateTime, List<BPTrendLineGraphUiModel>> get filteredYearData {
    return groupBy(state.bloodPressureList, (item) => item.dateWithYear);
  }

  void showLoader() {
    _loader.sink.add(true);
  }

  void hideLoader() {
    _loader.sink.add(false);
  }

  Future<void> getBPGraphData(
      BloodPressureTrendsLineGraphRequest request) async {
    _loader.sink.add(true);

    final response = await _bpRecordLineGraphUseCase(request);

    _loader.sink.add(false);

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final bpTrendsLineGraphResponse =
          response.asValue!.value.lineChartData?.map((e) => e.toDomain());
      final barChartResponse = response.asValue!.value.barChartData;
      _bpRecordState = state.copyWith(
          bloodPressureList: bpTrendsLineGraphResponse!.toList(),
          bpTrendsBarChartListItem: barChartResponse!.toList());

      // _navigation.sink.add(PhysicalActivityNavigation.food);
      return emit(_bpRecordState);
    }
  }

  Future<void> getBpRecordList(BpRecordPaginator bpRecordPaginator) async {
    _loader.sink.add(true);
    // _enableNext(isLoading: true);
    final response = await _getBpRecordListUseCase(bpRecordPaginator);
    //  _enableNext();
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

        _bpRecordState = state.copyWith(
            bpResponseList: newBpResponse,
            isLoading: false,
            isShowDialogAlertBp: false);
        _loader.sink.add(false);
        return emit(_bpRecordState);
      }
    } catch (e) {
      _loader.sink.add(false);
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  void updateisShowDialogAlertBp() {
    emit(state.copyWith(isShowDialogAlertBp: false));
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

        _bpRecordState = state.copyWith(
          bpResponseList: newBpResponse,
          isLoading: false,
        );
        return emit(_bpRecordState);
      }
    } catch (e) {
      _loader.sink.add(false);
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  Future<void> save(BpRequest bpRequest) async {
    _loader.sink.add(true);

    final response = await _bpRecordUseCase(bpRequest);
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        _loader.sink.add(false);
        List<BpResponse> newBpResponse = [];
        state.bpResponseList.forEach((element) {
          newBpResponse.add(element);
        });
        final bpResponse = response.asValue!.value;
        newBpResponse.add(BpResponse(
            title: bpResponse.title,
            type: bpResponse.type,
            description: bpResponse.description,
            userId: bpResponse.userId,
            id: bpResponse.id,
            systolicBP: bpResponse.systolicBP,
            diastolicBP: bpResponse.diastolicBP,
            pulse: bpResponse.pulse,
            createdAt: bpResponse.createdAt,
            isVisible: false,
            categoryBP: bpResponse.categoryBP));

        _bpRecordState = state.copyWith(
            isShowDialogAlertBp: true,
            alertBPContent: AlertBPContent(
                categoryBp: bpResponse.categoryBP,
                type: bpResponse.type,
                heading: bpResponse.title,
                description: bpResponse.description,
                systolic: bpResponse.systolicBP.toString(),
                diAstolic: bpResponse.diastolicBP.toString()),
            isAdded: false,
            bpResponseList: newBpResponse,
            isSystolicCorrect: false,
            isDiAstolicCorrect: false,
            isPulseCorrect: false,
            enableNext: false);

        return emit(_bpRecordState);
      }
    } catch (e) {
      _loader.sink.add(false);
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  String getDate(String input) {
    DateTime dateTime = DateTime.parse(input);
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

  void isAdded(bool isAdded) {
    emit(state.copyWith(isAdded: isAdded));
  }

  void isLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  void updateDialogvalue(bool isShow) {
    emit(state.copyWith(isShowDialogAlertBp: isShow));
  }

  void getSelectedItemIds() async {
    _loader.sink.add(true);
    final response = await _getSelectedItemUseCase(nothing);
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        _loader.sink.add(false);
        if (response.asValue!.value.lifeStyle.isNotEmpty) {
          final selectedLifeStyleIds = response.asValue!.value.lifeStyle;
          checkDateUpdateHealthFacts(selectedLifeStyleIds);
        } else {
          checkDateUpdateHealthFacts([1, 2, 3]);
        }
      }
    } catch (e) {
      _loader.sink.add(false);
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  void checkDateUpdateHealthFacts(List<int> selectedLifeStyleIds) async {
    var isDateChanged = await authStore.getisDateChange();
    var isHealthChanged = await authStore.gethealthCheckTracker();
    var isQuestionChanged = await authStore.getquestion();
    var isAnswerChanged = await authStore.getanswer();

    if (isDateChanged.isNotNull) {
      if (isHealthChanged.isNotNull) {
        String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
        String? storedDate = isDateChanged;
        if (storedDate! == currentDate) {
          var storeRandom = isHealthChanged;
          // emit(state.copyWith(dailyFact: listDailyFactsHome[storeRandom!]));
          authStore.setisDateChange(currentDate);
          authStore.sethealthCheckTracker(storeRandom!);
          authStore.setquestion(isQuestionChanged!);
          authStore.setanswer(isAnswerChanged!);
          emit(state.copyWith(
              dailyFact: listDailyFactsHome[storeRandom],
              questionareInnerIndex: isQuestionChanged,
              questionareAnswerInnerIndex: isAnswerChanged));
        } else {
          var random = selectedLifeStyleIds.isNotEmpty
              ? Random().nextInt(selectedLifeStyleIds.length)
              : 1;
          random = selectedLifeStyleIds.isNotEmpty
              ? selectedLifeStyleIds[random]
              : 1; //for daily fact name
          var question = listDailyFactsHome[random]
                  .questionaire
                  .questionaire
                  .isNotEmpty
              ? Random().nextInt(
                  listDailyFactsHome[random].questionaire.questionaire.length)
              : 0; //for daily fact random question
          var answer = listDailyFactsHome[random]
                  .questionaire
                  .questionaire
                  .values
                  .elementAt(question)
                  .isNotEmpty
              ? Random().nextInt(listDailyFactsHome[random]
                  .questionaire
                  .questionaire
                  .values
                  .elementAt(question)
                  .length)
              : 0;
          String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
          authStore.setisDateChange(currentDate);
          authStore.sethealthCheckTracker(random);
          authStore.setquestion(question);
          authStore.setanswer(answer);
          emit(state.copyWith(
              dailyFact: listDailyFactsHome[random],
              questionareInnerIndex: question,
              questionareAnswerInnerIndex: answer));
          // var random = selectedLifeStyleIds.isNotEmpty
          //     ? Random().nextInt(selectedLifeStyleIds.length)
          //     : 1;
          // random = selectedLifeStyleIds.isNotEmpty
          //     ? selectedLifeStyleIds[random]
          //     : 1;
          // String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
          // authStore.setisDateChange(currentDate);
          // authStore.sethealthCheckTracker(random);
          // emit(state.copyWith(dailyFact: listDailyFactsHome[random]));
        }
      }
    } else {
      //random is for topic
      //question is for question inside above random topic
      //answer
      var random = selectedLifeStyleIds.isNotEmpty
          ? Random().nextInt(selectedLifeStyleIds.length)
          : 1;
      random = selectedLifeStyleIds.isNotEmpty
          ? selectedLifeStyleIds[random]
          : 1; //for daily fact name
      var question =
          listDailyFactsHome[random].questionaire.questionaire.isNotEmpty
              ? Random().nextInt(
                  listDailyFactsHome[random].questionaire.questionaire.length)
              : 0; //for daily fact random question
      var answer = listDailyFactsHome[random]
              .questionaire
              .questionaire
              .values
              .elementAt(question)
              .isNotEmpty
          ? Random().nextInt(listDailyFactsHome[random]
              .questionaire
              .questionaire
              .values
              .elementAt(question)
              .length)
          : 0;
      String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      authStore.setisDateChange(currentDate);
      authStore.sethealthCheckTracker(random);
      authStore.setquestion(question);
      authStore.setanswer(answer);
      emit(state.copyWith(
          dailyFact: listDailyFactsHome[random],
          questionareInnerIndex: question,
          questionareAnswerInnerIndex: answer));
    }
  }

  @override
  Future<void> close() {
    _openDialog.close();
    _loader.close();
    _message.close();
    return super.close();
  }
}
