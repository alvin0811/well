// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BpResponse _$BpResponseFromJson(Map<String, dynamic> json) => BpResponse(
      userId: json['UserId'] as int,
      id: json['Id'] as int,
      systolicBP: json['SystolicBP'] as int,
      diastolicBP: json['DiastolicBP'] as int,
      pulse: json['Pulse'] as int,
      createdAt: json['CreatedAt'] as String,
      title: json['Title'] as String,
      description: json['Description'] as String,
      type: json['Type'] as String,
      categoryBP: json['CategoryBP'] as int,
      isVisible: json['IsVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$BpResponseToJson(BpResponse instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'Id': instance.id,
      'SystolicBP': instance.systolicBP,
      'DiastolicBP': instance.diastolicBP,
      'Pulse': instance.pulse,
      'CreatedAt': instance.createdAt,
      'Type': instance.type,
      'Title': instance.title,
      'Description': instance.description,
      'CategoryBP': instance.categoryBP,
      'IsVisible': instance.isVisible,
    };

BpResponseList _$BpResponseListFromJson(Map<String, dynamic> json) =>
    BpResponseList(
      bloodPressureList: (json['BloodPressureList'] as List<dynamic>)
          .map((e) => BpResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BpResponseListToJson(BpResponseList instance) =>
    <String, dynamic>{
      'BloodPressureList': instance.bloodPressureList,
    };

LifeStyleSelectedItem _$LifeStyleSelectedItemFromJson(
        Map<String, dynamic> json) =>
    LifeStyleSelectedItem(
      lifeStyle:
          (json['LifeStyle'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$LifeStyleSelectedItemToJson(
        LifeStyleSelectedItem instance) =>
    <String, dynamic>{
      'LifeStyle': instance.lifeStyle,
    };
