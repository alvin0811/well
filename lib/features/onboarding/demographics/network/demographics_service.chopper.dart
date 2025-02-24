// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demographics_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultDemographicService extends DefaultDemographicService {
  _$DefaultDemographicService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultDemographicService;

  @override
  Future<Response<DemographicResponse>> demographic(
      DemographicRequest request) {
    final Uri $url = Uri.parse('v1/demographics');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<DemographicResponse, DemographicResponse>($request);
  }

  @override
  Future<Response<DemographicResponse>> getDemoGraphic() {
    final Uri $url = Uri.parse('v1/demographics');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<DemographicResponse, DemographicResponse>($request);
  }
}
