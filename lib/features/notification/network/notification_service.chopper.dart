// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultNotificationService extends DefaultNotificationService {
  _$DefaultNotificationService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultNotificationService;

  @override
  Future<Response<GetNotificationListResponse>> getNotifications() {
    final Uri $url =
        Uri.parse('v1/notification/list?Column=CreatedAt&Direction=DESC');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<GetNotificationListResponse,
        GetNotificationListResponse>($request);
  }
}
