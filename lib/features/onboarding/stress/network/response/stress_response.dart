import 'package:freezed_annotation/freezed_annotation.dart';

part 'stress_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class StressResponse {
  StressResponse({required this.stressIds, required this.copingMechanisms});

  factory StressResponse.fromJson(Map<String, dynamic> json) =>
      _$StressResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StressResponseToJson(this);

  static const jsonFactory = _$StressResponseFromJson;

  final List<int> stressIds;
  final List<int> copingMechanisms;
}
