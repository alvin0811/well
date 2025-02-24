// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_category_details_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodPressureCategoryDetailRequest _$BloodPressureCategoryDetailRequestFromJson(
        Map<String, dynamic> json) =>
    BloodPressureCategoryDetailRequest(
      startDate: json['StartDate'] as String,
      endDate: json['EndDate'] as String,
      timeZoneOffset: json['TimeZoneOffset'] as String? ?? emptyString,
      categoryBP: json['CategoryBP'] as int,
    );

Map<String, dynamic> _$BloodPressureCategoryDetailRequestToJson(
        BloodPressureCategoryDetailRequest instance) =>
    <String, dynamic>{
      'TimeZoneOffset': instance.timeZoneOffset,
      'StartDate': instance.startDate,
      'EndDate': instance.endDate,
      'CategoryBP': instance.categoryBP,
    };
