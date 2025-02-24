import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/bp_record_service.dart';
import 'package:well_path/features/homescreens/trends/network/request/bp_trends_line_graph_request.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_line_graph_response.dart';

class BPRecordLineGraphUseCase extends UseCase<
    BloodPressureTrendsLineGraphRequest, BloodPressureTrendsLineGraphResponse> {
  BPRecordLineGraphUseCase(this._bpRecordService);

  final BpRecordService _bpRecordService;

  @override
  Future<Response<BloodPressureTrendsLineGraphResponse>> execute(
      BloodPressureTrendsLineGraphRequest params) {
    params.timeZoneOffset = DateTime.now().formatedOffset();
    return _bpRecordService.bpTrendsLineGraph(params);
  }
}
