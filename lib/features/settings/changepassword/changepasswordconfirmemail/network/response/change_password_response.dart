import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_response.g.dart';

@JsonSerializable()
class ChangePasswordResponse {
  ChangePasswordResponse({
    required this.token,
    required this.message,
  });

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);

  static const jsonFactory = _$ChangePasswordResponseFromJson;

  @JsonKey(name: 'Token')
  String token;
  final String? message;
}
