// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultResetPasswordService extends DefaultResetPasswordService {
  _$DefaultResetPasswordService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultResetPasswordService;

  @override
  Future<Response<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest request) {
    final Uri $url = Uri.parse('v1/auth/reset-password');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ResetPasswordResponse, ResetPasswordResponse>($request);
  }
}
