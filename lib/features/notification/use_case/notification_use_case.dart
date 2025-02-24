import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/notification/network/notification_service.dart';
import 'package:well_path/features/notification/network/response/notification_list_response.dart';

class GetNotificationsUseCase extends UseCase<Nothing, GetNotificationListResponse> {
  GetNotificationsUseCase(this._notificationService);

  final NotificationService _notificationService;

  @override
  Future<Response<GetNotificationListResponse>> execute(Nothing params) {
    return _notificationService.getNotifications();
  }
}
