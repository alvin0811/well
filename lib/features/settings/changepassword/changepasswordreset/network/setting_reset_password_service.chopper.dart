// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_reset_password_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultSettingResetPasswordService
    extends DefaultSettingResetPasswordService {
  _$DefaultSettingResetPasswordService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultSettingResetPasswordService;

  @override
  Future<Response<SettingResetPasswordResponse>> resetPassword(
      SettingResetPasswordRequest request) {
    final Uri $url = Uri.parse('v1/auth/reset-password');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SettingResetPasswordResponse,
        SettingResetPasswordResponse>($request);
  }
}
