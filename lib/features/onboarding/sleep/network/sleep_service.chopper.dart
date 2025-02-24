// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultSleepService extends DefaultSleepService {
  _$DefaultSleepService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultSleepService;

  @override
  Future<Response<SleepResponse>> sleep(SleepRequest request) {
    final Uri $url = Uri.parse('v1/sleep');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SleepResponse, SleepResponse>($request);
  }

  @override
  Future<Response<SleepResponse>> getsleeps() {
    final Uri $url = Uri.parse('v1/sleep');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SleepResponse, SleepResponse>($request);
  }
}
