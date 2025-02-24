import 'package:chopper/chopper.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/request/bp_request.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/response/bp_response.dart';
import 'package:well_path/features/homescreens/trends/network/request/bp_category_details_request.dart';
import 'package:well_path/features/homescreens/trends/network/request/bp_export_graph_request.dart';
import 'package:well_path/features/homescreens/trends/network/request/bp_trends_line_graph_request.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_category_details_response.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_line_graph_response.dart';
import 'package:well_path/features/homescreens/trends/network/response/csv_report_download_response.dart';
import 'package:well_path/helper/helpers.dart';

part 'trends_service.chopper.dart';

abstract class BPTrendsService {
  Future<Response<BloodPressureTrendsLineGraphResponse>> bpTrendsLineGraph(
      @Body() BloodPressureTrendsLineGraphRequest request);

  Future<Response<BPCategoryDetailsResponse>> bpCategoryDetails(
      @Body() BloodPressureCategoryDetailRequest request);

  Future<Response<CSVReportDownloadResponse>> downloadCSVReport(
      @Body() BloodPressureExportGraphRequest request);

  //for pagination...
  Future<Response<BpResponse>> bpRecord(@Body() BpRequest request);
  Future<Response<BpResponseList>> getBpRecordList(@Query('Offset') int offset,
      @Query('Limit') int limit, @Query('Direction') String asc);
}

@ChopperApi()
abstract class DefaultTrendsService extends CS implements BPTrendsService {
  static DefaultTrendsService create() => _$DefaultTrendsService();

  @Post(path: 'v1/analytics/graphs')
  @override
  Future<Response<BloodPressureTrendsLineGraphResponse>> bpTrendsLineGraph(
      @Body() BloodPressureTrendsLineGraphRequest request);

  @Post(path: 'v1/analytics/trends')
  @override
  Future<Response<BPCategoryDetailsResponse>> bpCategoryDetails(
      @Body() BloodPressureCategoryDetailRequest request);

  @Post(path: 'v1/report/download/link')
  @override
  Future<Response<CSVReportDownloadResponse>> downloadCSVReport(
      @Body() BloodPressureExportGraphRequest request);

  @Put(path: 'v1/blood-pressure')
  @override
  Future<Response<BpResponse>> bpRecord(@Body() BpRequest request);

  @Get(path: 'v1/blood-pressure')
  @override
  Future<Response<BpResponseList>> getBpRecordList(@Query('Page') int page,
      @Query('Limit') int limit, @Query('Direction') String asc);
}
