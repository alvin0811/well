import 'package:freezed_annotation/freezed_annotation.dart';

part 'bp_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class BpResponse {
  BpResponse(
      {required this.userId,
      required this.id,
      required this.systolicBP,
      required this.diastolicBP,
      required this.pulse,
      required this.createdAt,
      required this.title,
      required this.description,
      required this.type,
      required this.categoryBP,
      this.isVisible = false});

  factory BpResponse.fromJson(Map<String, dynamic> json) =>
      _$BpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BpResponseToJson(this);

  static const jsonFactory = _$BpResponseFromJson;

  final int userId;
  final int id;
  final int systolicBP;
  final int diastolicBP;
  final int pulse;
  final String createdAt;
  final String type;
  final String title;
  final String description;
  final int categoryBP;
  @Default(false)
  bool isVisible;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class BpResponseList {
  BpResponseList({required this.bloodPressureList});

  factory BpResponseList.fromJson(Map<String, dynamic> json) =>
      _$BpResponseListFromJson(json);
  Map<String, dynamic> toJson() => _$BpResponseListToJson(this);

  static const jsonFactory = _$BpResponseListFromJson;

  final List<BpResponse> bloodPressureList;
}


@JsonSerializable(fieldRename: FieldRename.pascal)
class LifeStyleSelectedItem {
  LifeStyleSelectedItem({required this.lifeStyle});

  factory LifeStyleSelectedItem.fromJson(Map<String, dynamic> json) =>
      _$LifeStyleSelectedItemFromJson(json);
  Map<String, dynamic> toJson() => _$LifeStyleSelectedItemToJson(this);

  static const jsonFactory = _$LifeStyleSelectedItemFromJson;

  final List<int> lifeStyle;
}
