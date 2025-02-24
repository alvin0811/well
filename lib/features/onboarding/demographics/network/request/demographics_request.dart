import 'package:freezed_annotation/freezed_annotation.dart';

part 'demographics_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class DemographicRequest {
  DemographicRequest({
    required this.gender,
    required this.dateOfBirth,
    required this.ethnicity,
  });

  factory DemographicRequest.fromJson(Map<String, dynamic> json) =>
      _$DemographicRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DemographicRequestToJson(this);

  final GenderStatus gender;

  final String dateOfBirth;

  final EthnicityStatus ethnicity;
}

enum GenderStatus {
  @JsonValue(1)
  male,
  @JsonValue(0)
  feMale,
  @JsonValue(2)
  others,
}

enum EthnicityStatus {
  @JsonValue(0)
  white,
  @JsonValue(1)
  africanAmerican,
  @JsonValue(2)
  asian,
  @JsonValue(3)
  americanIndian,
  @JsonValue(4)
  nativeHawaiian,
  @JsonValue(5)
  other,
}
