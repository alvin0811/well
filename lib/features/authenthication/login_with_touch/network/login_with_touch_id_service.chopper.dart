// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_with_touch_id_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultLoginWithTouchIdService extends DefaultLoginWithTouchIdService {
  _$DefaultLoginWithTouchIdService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultLoginWithTouchIdService;

  @override
  Future<Response<LoginWithTouchIdResponse>> login(
      LoginWithTouchIdRequest request) {
    final Uri $url = Uri.parse('v1/auth/login');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<LoginWithTouchIdResponse, LoginWithTouchIdResponse>($request);
  }
}
