import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse({
    required this.token,
    required this.deviceUUID,
    required this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  static const jsonFactory = _$LoginResponseFromJson;

  @JsonKey(name: 'Token')
  String token;
  @JsonKey(name: 'DeviceUUID')
  String deviceUUID;
  final String? message;
}
