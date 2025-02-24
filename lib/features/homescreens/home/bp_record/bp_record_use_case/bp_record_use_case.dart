import 'package:chopper/chopper.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/bp_record_service.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/response/bp_response.dart';

import '../../../../../base_usecase/base_usecase.dart';
import '../network/request/bp_request.dart';

class BpRecordUseCase extends UseCase<BpRequest, BpResponse> {
  BpRecordUseCase(this._bpRecordService);

  final BpRecordService _bpRecordService;

  @override
  Future<Response<BpResponse>> execute(BpRequest params) {
    return _bpRecordService.bpRecord(params);
  }
}
