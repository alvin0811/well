// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_category_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BPCategoryDetailsResponse _$BPCategoryDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    BPCategoryDetailsResponse(
      data: (json['Data'] as List<dynamic>?)
          ?.map((e) =>
              BPTrendsLineChartListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BPCategoryDetailsResponseToJson(
        BPCategoryDetailsResponse instance) =>
    <String, dynamic>{
      'Data': instance.data,
    };
