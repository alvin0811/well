// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_otp_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultChangePasswordOtpService
    extends DefaultChangePasswordOtpService {
  _$DefaultChangePasswordOtpService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultChangePasswordOtpService;

  @override
  Future<Response<ChangePasswordOtpResponse>> changeOtpPassword(
      ChangePasswordOtpRequest request) {
    final Uri $url = Uri.parse('v1/auth/change-password/verification');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ChangePasswordOtpResponse, ChangePasswordOtpResponse>($request);
  }
}
