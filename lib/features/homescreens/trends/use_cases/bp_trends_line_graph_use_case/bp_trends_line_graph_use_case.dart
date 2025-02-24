import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/homescreens/trends/network/request/bp_trends_line_graph_request.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_line_graph_response.dart';
import 'package:well_path/features/homescreens/trends/network/trends_service.dart';

class BPTrendsLineGraphUseCase extends UseCase<
    BloodPressureTrendsLineGraphRequest, BloodPressureTrendsLineGraphResponse> {
  BPTrendsLineGraphUseCase(this._trendsService);

  final BPTrendsService _trendsService;

  @override
  Future<Response<BloodPressureTrendsLineGraphResponse>> execute(
      BloodPressureTrendsLineGraphRequest params) {
    params.timeZoneOffset = DateTime.now().formatedOffset();
    return _trendsService.bpTrendsLineGraph(params);
  }
}
