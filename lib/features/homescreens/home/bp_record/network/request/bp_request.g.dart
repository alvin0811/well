// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BpRequest _$BpRequestFromJson(Map<String, dynamic> json) => BpRequest(
      systolicBP: json['SystolicBP'] as int,
      diastolicBP: json['DiastolicBP'] as int,
      pulse: json['Pulse'] as int,
    );

Map<String, dynamic> _$BpRequestToJson(BpRequest instance) => <String, dynamic>{
      'SystolicBP': instance.systolicBP,
      'DiastolicBP': instance.diastolicBP,
      'Pulse': instance.pulse,
    };
