import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/onboarding/food/network/response/food_response.dart';

part 'food_state.freezed.dart';

@freezed
class FoodState with _$FoodState {
  const factory FoodState({
    @Default(null) bool? cookOwnFood,
    @Default(null) bool? eatAtHome,
    @Default(0) int? homeCookedFoodQuantity,
    @Default(null) bool? feelFull,
    @Default(null) bool? feelGuilty,
    @Default(null) bool? averageMealHealthy,
    @Default(0) int? noOfPortionsPerDay,
    @Default([]) List<FoodItem> healthyFoodIds,
    @Default([]) List<FoodItem> unhealthyFoodIds,
    @Default([]) List<int> selectedHealthyFoods,
    @Default([]) List<int> selectedUnhealthyFoods,
    @Default(null) bool? consumeAlcohol,
    @Default(0) int? alcoholQuantity,
  }) = _FoodState;

  const FoodState._();
}
