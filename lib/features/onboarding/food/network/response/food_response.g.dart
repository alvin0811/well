// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodResponse _$FoodResponseFromJson(Map<String, dynamic> json) => FoodResponse(
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

Map<String, dynamic> _$FoodResponseToJson(FoodResponse instance) =>
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

FoodListResponse _$FoodListResponseFromJson(Map<String, dynamic> json) =>
    FoodListResponse(
      healthyFoodList: (json['HealthyFoodList'] as List<dynamic>)
          .map((e) => FoodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      unhealthyFoodList: (json['UnhealthyFoodList'] as List<dynamic>)
          .map((e) => FoodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FoodListResponseToJson(FoodListResponse instance) =>
    <String, dynamic>{
      'HealthyFoodList': instance.healthyFoodList,
      'UnhealthyFoodList': instance.unhealthyFoodList,
    };

FoodItem _$FoodItemFromJson(Map<String, dynamic> json) => FoodItem(
      id: json['Id'] as int,
      title: json['Title'] as String,
      isHealthy: json['IsHealthy'] as bool,
    );

Map<String, dynamic> _$FoodItemToJson(FoodItem instance) => <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'IsHealthy': instance.isHealthy,
    };
