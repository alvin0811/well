// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'physical_activity_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultPhysicalActivityService extends DefaultPhysicalActivityService {
  _$DefaultPhysicalActivityService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultPhysicalActivityService;

  @override
  Future<Response<PhysicalActivityResponse>> physicalActivity(
      PhysicalActivityRequest request) {
    final Uri $url = Uri.parse('v1/physical-activity');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<PhysicalActivityResponse, PhysicalActivityResponse>($request);
  }

  @override
  Future<Response<PhysicalActivityResponse>> getPhysicalActivity() {
    final Uri $url = Uri.parse('v1/physical-activity');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<PhysicalActivityResponse, PhysicalActivityResponse>($request);
  }

  @override
  Future<Response<GetDisabilitiesListResponse>> getDisabilitiesList() {
    final Uri $url = Uri.parse('v1/disabilities/list');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<GetDisabilitiesListResponse,
        GetDisabilitiesListResponse>($request);
  }
}
