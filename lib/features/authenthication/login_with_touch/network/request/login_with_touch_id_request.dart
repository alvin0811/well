import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_with_touch_id_request.g.dart';

@JsonSerializable()
class LoginWithTouchIdRequest {
  LoginWithTouchIdRequest({
    required this.email,
    required this.password,
  });

  factory LoginWithTouchIdRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginWithTouchIdRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginWithTouchIdRequestToJson(this);

  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'Password')
  final String password;
}
