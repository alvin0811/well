import 'package:chopper/chopper.dart';
import 'package:well_path/features/notification/network/response/notification_list_response.dart';
import 'package:well_path/helper/helpers.dart';

part 'notification_service.chopper.dart';

abstract class NotificationService {
  Future<Response<GetNotificationListResponse>> getNotifications();
}

@ChopperApi()
abstract class DefaultNotificationService extends CS
    implements NotificationService {
  static DefaultNotificationService create() => _$DefaultNotificationService();

  @Get(path: 'v1/notification/list?Column=CreatedAt&Direction=DESC')
  @override
  Future<Response<GetNotificationListResponse>> getNotifications();
}
