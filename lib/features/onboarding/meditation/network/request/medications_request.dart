import 'package:freezed_annotation/freezed_annotation.dart';

part 'medications_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class MeditationRequest {
  MeditationRequest(
      {required this.medicationLevel,
      required this.activityLevel,
      required this.medicationIds});

  factory MeditationRequest.fromJson(Map<String, dynamic> json) =>
      _$MeditationRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MeditationRequestToJson(this);

  final int? medicationLevel;
  final int? activityLevel;
  final List<int> medicationIds;
}
