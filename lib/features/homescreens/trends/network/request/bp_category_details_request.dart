import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/helper/helpers.dart';

part 'bp_category_details_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class BloodPressureCategoryDetailRequest {
  BloodPressureCategoryDetailRequest(
      {required this.startDate,
      required this.endDate,
      this.timeZoneOffset = emptyString,
      required this.categoryBP});

  factory BloodPressureCategoryDetailRequest.fromJson(
          Map<String, dynamic> json) =>
      _$BloodPressureCategoryDetailRequestFromJson(json);
  Map<String, dynamic> toJson() =>
      _$BloodPressureCategoryDetailRequestToJson(this);

  static const jsonFactory = _$BloodPressureCategoryDetailRequestFromJson;

  String timeZoneOffset;
  final String startDate;
  final String endDate;
  final int categoryBP;
}
