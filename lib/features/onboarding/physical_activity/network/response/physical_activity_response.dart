import 'package:freezed_annotation/freezed_annotation.dart';

part 'physical_activity_response.g.dart';

// Get Disabilities Response
@JsonSerializable(fieldRename: FieldRename.pascal)
class GetDisabilitiesListResponse {
  const GetDisabilitiesListResponse({required this.disabilityList});

  factory GetDisabilitiesListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDisabilitiesListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetDisabilitiesListResponseToJson(this);

  static const jsonFactory = _$GetDisabilitiesListResponseFromJson;

  final List<DisabilityItem> disabilityList;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class DisabilityItem {
  DisabilityItem(
      {required this.id, required this.title, required this.isSelected});

  factory DisabilityItem.fromJson(Map<String, dynamic> json) =>
      _$DisabilityItemFromJson(json);
  Map<String, dynamic> toJson() => _$DisabilityItemToJson(this);

  static const jsonFactory = _$DisabilityItemFromJson;

  final int id;
  final String title;
  bool? isSelected = false;
}

// Get Response
@JsonSerializable(fieldRename: FieldRename.pascal)
class PhysicalActivityResponse {
  const PhysicalActivityResponse(
      {required this.activeTime,
      required this.haveDisability,
      required this.disabilityIds});

  factory PhysicalActivityResponse.fromJson(Map<String, dynamic> json) =>
      _$PhysicalActivityResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PhysicalActivityResponseToJson(this);

  static const jsonFactory = _$PhysicalActivityResponseFromJson;

  final int? activeTime;
  final bool? haveDisability;
  final List<int> disabilityIds;
}
