// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultSignUpService extends DefaultSignUpService {
  _$DefaultSignUpService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultSignUpService;

  @override
  Future<Response<SignUpResponse>> signup(SignUpRequest request) {
    final Uri $url = Uri.parse('v1/auth/signup');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SignUpResponse, SignUpResponse>($request);
  }
}
