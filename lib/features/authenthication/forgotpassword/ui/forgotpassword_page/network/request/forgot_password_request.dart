import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_request.g.dart';

@JsonSerializable()
class ForgotPasswordRequest {
  ForgotPasswordRequest({required this.email});

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);

  static const jsonFactory = _$ForgotPasswordRequestFromJson;

  @JsonKey(name: 'Email')
  final String email;
}
