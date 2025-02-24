import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class FoodResponse {
  FoodResponse({
    required this.cookOwnFood,
    required this.eatAtHome,
    required this.homeCookedFoodQuantity,
    required this.feelFull,
    required this.averageMealHealthy,
    required this.feelGuilty,
    required this.noOfPortionsPerDay,
    required this.healthyFoodIds,
    required this.unhealthyFoodIds,
    required this.consumeAlcohol,
    required this.alcoholQuantity,
  });

  factory FoodResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FoodResponseToJson(this);

  static const jsonFactory = _$FoodResponseFromJson;

  final bool? cookOwnFood;
  final bool? eatAtHome;
  final int? homeCookedFoodQuantity;
  final bool? feelFull;
  final bool? averageMealHealthy;
  final bool? feelGuilty;
  final int? noOfPortionsPerDay;
  final List<int> healthyFoodIds;
  final List<int> unhealthyFoodIds;
  final bool? consumeAlcohol;
  final int? alcoholQuantity;
}

//Healthy Unhealthy food model to get listof()

@JsonSerializable(fieldRename: FieldRename.pascal)
class FoodListResponse {
  FoodListResponse(
      {required this.healthyFoodList, required this.unhealthyFoodList});

  factory FoodListResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FoodListResponseToJson(this);

  static const jsonFactory = _$FoodListResponseFromJson;

  final List<FoodItem> healthyFoodList;
  final List<FoodItem> unhealthyFoodList;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class FoodItem {
  FoodItem({required this.id, required this.title, required this.isHealthy});

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);
  Map<String, dynamic> toJson() => _$FoodItemToJson(this);

  static const jsonFactory = _$FoodItemFromJson;

  final int id;
  final String title;
  final bool isHealthy;
}
