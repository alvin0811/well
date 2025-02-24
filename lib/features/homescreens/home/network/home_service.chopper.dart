// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultHomeService extends DefaultHomeService {
  _$DefaultHomeService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultHomeService;

  @override
  Future<Response<HomeResponse>> getUserDetails() {
    final Uri $url = Uri.parse('v1/user/me');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );

    return client.send<HomeResponse, HomeResponse>($request);
  }
}
