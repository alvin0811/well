import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  ChangePasswordRequest({required this.token});

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);

  static const jsonFactory = _$ChangePasswordRequestFromJson;

  @JsonKey(name: 'Token')
  final String token;
}
