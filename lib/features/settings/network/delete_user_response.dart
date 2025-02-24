import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class DeleteUserResponse {
  const DeleteUserResponse(
      {required this.data, required this.message, required this.error});

  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteUserResponseToJson(this);

  static const jsonFactory = _$DeleteUserResponseFromJson;

  final bool data;
  final String? message;
  final String? error;
}
