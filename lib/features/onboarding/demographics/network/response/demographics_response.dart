import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/onboarding/demographics/network/request/demographics_request.dart';

part 'demographics_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class DemographicResponse {
  DemographicResponse({
    required this.id,
    required this.userId,
    required this.gender,
    required this.dateOfBirth,
    required this.ethnicity,
  });

  factory DemographicResponse.fromJson(Map<String, dynamic> json) =>
      _$DemographicResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DemographicResponseToJson(this);

  static const jsonFactory = _$DemographicResponseFromJson;

  final int? id;

  final int? userId;

  final GenderStatus? gender;

  final String? dateOfBirth;

  final EthnicityStatus? ethnicity;
}
