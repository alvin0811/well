import 'package:freezed_annotation/freezed_annotation.dart';

part 'medications_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class MeditationResponse {
  MeditationResponse(
      {required this.medicationLevel,
      required this.activityLevel,
      required this.medicationIds});

  factory MeditationResponse.fromJson(Map<String, dynamic> json) =>
      _$MeditationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MeditationResponseToJson(this);

  static const jsonFactory = _$MeditationResponseFromJson;

  final int? medicationLevel;
  final int? activityLevel;
  final List<int> medicationIds;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class MedicationListResponse {
  const MedicationListResponse({required this.medicationList});

  factory MedicationListResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicationListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MedicationListResponseToJson(this);

  static const jsonFactory = _$MedicationListResponseFromJson;

  final List<MedicationItem> medicationList;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class MedicationItem {
  MedicationItem(
      {required this.id, required this.title, required this.isSelected});

  factory MedicationItem.fromJson(Map<String, dynamic> json) =>
      _$MedicationItemFromJson(json);
  Map<String, dynamic> toJson() => _$MedicationItemToJson(this);

  static const jsonFactory = _$MedicationItemFromJson;

  final int id;
  final String title;
  bool? isSelected = false;
}
