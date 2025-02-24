import 'package:json_annotation/json_annotation.dart';

part 'login_with_touch_id_response.g.dart';

@JsonSerializable()
class LoginWithTouchIdResponse {
  LoginWithTouchIdResponse({
    required this.token,
    required this.deviceUUID,
    required this.message,
  });

  factory LoginWithTouchIdResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginWithTouchIdResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginWithTouchIdResponseToJson(this);

  static const jsonFactory = _$LoginWithTouchIdResponseFromJson;

  @JsonKey(name: 'Token')
  String token;
  @JsonKey(name: 'DeviceUUID')
  String deviceUUID;
  final String? message;
}
