// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trends_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultTrendsService extends DefaultTrendsService {
  _$DefaultTrendsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultTrendsService;

  @override
  Future<Response<BloodPressureTrendsLineGraphResponse>> bpTrendsLineGraph(
      BloodPressureTrendsLineGraphRequest request) {
    final Uri $url = Uri.parse('v1/analytics/graphs');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<BloodPressureTrendsLineGraphResponse,
        BloodPressureTrendsLineGraphResponse>($request);
  }

  @override
  Future<Response<BPCategoryDetailsResponse>> bpCategoryDetails(
      BloodPressureCategoryDetailRequest request) {
    final Uri $url = Uri.parse('v1/analytics/trends');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<BPCategoryDetailsResponse, BPCategoryDetailsResponse>($request);
  }

  @override
  Future<Response<CSVReportDownloadResponse>> downloadCSVReport(
      BloodPressureExportGraphRequest request) {
    final Uri $url = Uri.parse('v1/report/download/link');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<CSVReportDownloadResponse, CSVReportDownloadResponse>($request);
  }

  @override
  Future<Response<BpResponse>> bpRecord(BpRequest request) {
    final Uri $url = Uri.parse('v1/blood-pressure');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<BpResponse, BpResponse>($request);
  }

  @override
  Future<Response<BpResponseList>> getBpRecordList(
    int page,
    int limit,
    String asc,
  ) {
    final Uri $url = Uri.parse('v1/blood-pressure');
    final Map<String, dynamic> $params = <String, dynamic>{
      'Page': page,
      'Limit': limit,
      'Direction': asc,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<BpResponseList, BpResponseList>($request);
  }
}
