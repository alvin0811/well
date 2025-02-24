import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  LoginRequest({
    required this.email,
    required this.password,
    required this.fcmToken
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'Password')
  final String password;
  @JsonKey(name: 'FCMToken')
  final String fcmToken;
}
