// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_export_graph_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodPressureExportGraphRequest _$BloodPressureExportGraphRequestFromJson(
        Map<String, dynamic> json) =>
    BloodPressureExportGraphRequest(
      image: json['Image'] as String,
      timeFilter: json['TimeFilter'] as int,
    );

Map<String, dynamic> _$BloodPressureExportGraphRequestToJson(
        BloodPressureExportGraphRequest instance) =>
    <String, dynamic>{
      'Image': instance.image,
      'TimeFilter': instance.timeFilter,
    };
