// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_record_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultBpRecordService extends DefaultBpRecordService {
  _$DefaultBpRecordService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultBpRecordService;

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
  Future<Response<LifeStyleSelectedItem>> lifeStyleSelecteditems() {
    final Uri $url = Uri.parse('v1/lifestyle/selected/ids');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<LifeStyleSelectedItem, LifeStyleSelectedItem>($request);
  }
}
