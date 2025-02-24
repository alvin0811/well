import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class FoodRequest {
  FoodRequest({
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

  factory FoodRequest.fromJson(Map<String, dynamic> json) =>
      _$FoodRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FoodRequestToJson(this);

  static const jsonFactory = _$FoodRequestFromJson;

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
