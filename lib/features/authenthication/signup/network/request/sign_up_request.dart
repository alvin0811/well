import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  SignUpRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.fcmToken
    // required this.passwordConfirmation,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);

  @JsonKey(name: 'FullName')
  final String name;
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'PhoneNumber')
  final String phone;
  @JsonKey(name: 'Password')
  final String password;
  @JsonKey(name: 'FCMToken')
  final String fcmToken;
}
