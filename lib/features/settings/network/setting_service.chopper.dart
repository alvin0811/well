// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultSettingService extends DefaultSettingService {
  _$DefaultSettingService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultSettingService;

  @override
  Future<Response<DeleteUserResponse>> deleteUser() {
    final Uri $url = Uri.parse('v1/user');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<DeleteUserResponse, DeleteUserResponse>($request);
  }
}
