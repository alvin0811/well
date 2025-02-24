// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verification_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultOtpVerificationService extends DefaultOtpVerificationService {
  _$DefaultOtpVerificationService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultOtpVerificationService;

  @override
  Future<Response<OtpVerificationResponse>> otpVerification(
      OtpVerificationRequest request) {
    final Uri $url = Uri.parse('v1/auth/forgot-password/verification');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<OtpVerificationResponse, OtpVerificationResponse>($request);
  }

  @override
  Future<Response<ForgotPasswordResponse>> forgetPassword(
      ForgotPasswordRequest request) {
    final Uri $url = Uri.parse('v1/auth/forgot-password');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ForgotPasswordResponse, ForgotPasswordResponse>($request);
  }
}
