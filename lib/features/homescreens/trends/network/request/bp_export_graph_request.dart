import 'package:freezed_annotation/freezed_annotation.dart';
part 'bp_export_graph_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class BloodPressureExportGraphRequest {
  BloodPressureExportGraphRequest(
      {required this.image, required this.timeFilter});

  factory BloodPressureExportGraphRequest.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureExportGraphRequestFromJson(json);
  Map<String, dynamic> toJson() =>
      _$BloodPressureExportGraphRequestToJson(this);

  static const jsonFactory = _$BloodPressureExportGraphRequestFromJson;

  final String image;
  final int timeFilter;
}
