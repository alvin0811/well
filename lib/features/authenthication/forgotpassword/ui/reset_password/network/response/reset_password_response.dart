import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse {
  ResetPasswordResponse({
    required this.data,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);

  static const jsonFactory = _$ResetPasswordResponseFromJson;
  @JsonKey(name: 'data')
  final bool data;
}
