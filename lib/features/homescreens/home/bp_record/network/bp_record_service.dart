import 'package:chopper/chopper.dart';
import 'package:well_path/features/homescreens/trends/network/request/bp_trends_line_graph_request.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_line_graph_response.dart';
import 'package:well_path/helper/helpers.dart';
import 'request/bp_request.dart';
import 'response/bp_response.dart';

part 'bp_record_service.chopper.dart';

abstract class BpRecordService {
  Future<Response<BpResponse>> bpRecord(@Body() BpRequest request);

  Future<Response<BpResponseList>> getBpRecordList(@Query('Offset') int offset,
      @Query('Limit') int limit, @Query('Direction') String asc);

  Future<Response<BloodPressureTrendsLineGraphResponse>> bpTrendsLineGraph(
      @Body() BloodPressureTrendsLineGraphRequest request);

  Future<Response<LifeStyleSelectedItem>> lifeStyleSelecteditems();
}

@ChopperApi()
abstract class DefaultBpRecordService extends CS implements BpRecordService {
  static DefaultBpRecordService create() => _$DefaultBpRecordService();

  @Put(path: 'v1/blood-pressure')
  @override
  Future<Response<BpResponse>> bpRecord(@Body() BpRequest request);

  @Get(path: 'v1/blood-pressure')
  @override
  Future<Response<BpResponseList>> getBpRecordList(@Query('Page') int page,
      @Query('Limit') int limit, @Query('Direction') String asc);

  @Post(path: 'v1/analytics/graphs')
  @override
  Future<Response<BloodPressureTrendsLineGraphResponse>> bpTrendsLineGraph(
      @Body() BloodPressureTrendsLineGraphRequest request);

  @Get(path: 'v1/lifestyle/selected/ids')
  @override
  Future<Response<LifeStyleSelectedItem>> lifeStyleSelecteditems();
}
