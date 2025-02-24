import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/homescreens/home/bp_record/models/bp_record_paginator.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/bp_record_service.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/response/bp_response.dart';
import 'package:well_path/features/homescreens/trends/network/trends_service.dart';

class GetBpRecordListUseCase
    extends UseCase<BpRecordPaginator, BpResponseList> {
  GetBpRecordListUseCase(this._bpRecordService);

  final BpRecordService _bpRecordService;

  @override
  Future<Response<BpResponseList>> execute(BpRecordPaginator params) {
    return _bpRecordService.getBpRecordList(
        params.offset, params.limit, "DESC");
  }
}

class GetBpRecordListUseCaseNew extends UseCase<BpRecordPaginator, BpResponseList> {
  GetBpRecordListUseCaseNew(this._bpTrendService);

  final BPTrendsService _bpTrendService;

  @override
  Future<Response<BpResponseList>> execute(BpRecordPaginator params) {
    return _bpTrendService.getBpRecordList(params.offset, params.limit, "DESC");
  }
}
