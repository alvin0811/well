// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stress_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultStressService extends DefaultStressService {
  _$DefaultStressService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultStressService;

  @override
  Future<Response<StressListResponse>> getStressList() {
    final Uri $url = Uri.parse('v1/stress/list');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<StressListResponse, StressListResponse>($request);
  }

  @override
  Future<Response<StressResponse>> getStress() {
    final Uri $url = Uri.parse('v1/stress');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<StressResponse, StressResponse>($request);
  }

  @override
  Future<Response<StressResponse>> stress(StressRequest stressRequest) {
    final Uri $url = Uri.parse('v1/stress');
    final $body = stressRequest;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<StressResponse, StressResponse>($request);
  }
}
