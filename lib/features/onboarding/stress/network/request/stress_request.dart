import 'package:freezed_annotation/freezed_annotation.dart';

part 'stress_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class StressRequest {
  StressRequest({required this.stressIds, required this.copingMechanisms});

  factory StressRequest.fromJson(Map<String, dynamic> json) =>
      _$StressRequestFromJson(json);
  Map<String, dynamic> toJson() => _$StressRequestToJson(this);

  final List<int> stressIds;
  final List<int> copingMechanisms;
}

enum BinaryChoice {
  @JsonValue(true)
  yes,
  @JsonValue(false)
  no,
  @JsonValue(Null)
  other,
}
