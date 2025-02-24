import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/notification/network/response/notification_list_response.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default([]) List<NotificationListItem> notificationList,
  }) = _NotificationState;

  const NotificationState._();
}
