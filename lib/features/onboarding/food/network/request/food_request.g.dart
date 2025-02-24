// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodRequest _$FoodRequestFromJson(Map<String, dynamic> json) => FoodRequest(
      cookOwnFood: json['CookOwnFood'] as bool?,
      eatAtHome: json['EatAtHome'] as bool?,
      homeCookedFoodQuantity: json['HomeCookedFoodQuantity'] as int?,
      feelFull: json['FeelFull'] as bool?,
      averageMealHealthy: json['AverageMealHealthy'] as bool?,
      feelGuilty: json['FeelGuilty'] as bool?,
      noOfPortionsPerDay: json['NoOfPortionsPerDay'] as int?,
      healthyFoodIds: (json['HealthyFoodIds'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      unhealthyFoodIds: (json['UnhealthyFoodIds'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      consumeAlcohol: json['ConsumeAlcohol'] as bool?,
      alcoholQuantity: json['AlcoholQuantity'] as int?,
    );

Map<String, dynamic> _$FoodRequestToJson(FoodRequest instance) =>
    <String, dynamic>{
      'CookOwnFood': instance.cookOwnFood,
      'EatAtHome': instance.eatAtHome,
      'HomeCookedFoodQuantity': instance.homeCookedFoodQuantity,
      'FeelFull': instance.feelFull,
      'AverageMealHealthy': instance.averageMealHealthy,
      'FeelGuilty': instance.feelGuilty,
      'NoOfPortionsPerDay': instance.noOfPortionsPerDay,
      'HealthyFoodIds': instance.healthyFoodIds,
      'UnhealthyFoodIds': instance.unhealthyFoodIds,
      'ConsumeAlcohol': instance.consumeAlcohol,
      'AlcoholQuantity': instance.alcoholQuantity,
    };
