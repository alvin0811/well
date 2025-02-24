import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'notification_list_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class GetNotificationListResponse {
  GetNotificationListResponse({
    required this.data,
    required this.totalCount,
  });

  factory GetNotificationListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetNotificationListResponseToJson(this);

  static const jsonFactory = _$GetNotificationListResponseFromJson;

  final List<NotificationListItem>? data;
  final int? totalCount;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class NotificationListItem {
  NotificationListItem({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory NotificationListItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationListItemFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationListItemToJson(this);

  static const jsonFactory = _$NotificationListItemFromJson;

  final int id;
  final String title;
  final String description;
  final String createdAt;

  // This computed property is treated like a function
  // that returns a value.
  String formattedDate() {
    DateTime dateTime = DateTime.parse(createdAt).toLocal();
    String formattedDate = DateFormat("MM/dd/yyyy hh:mm a").format(dateTime);
    return formattedDate;
  }
}
