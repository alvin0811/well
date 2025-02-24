import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/features/onboarding/food/cubit/food_navigation_enums.dart';
import 'package:well_path/features/onboarding/food/food_use_case/food_use_case.dart';
import 'package:well_path/features/onboarding/food/get_food_list_use_case/get_food_list_use_case.dart';
import 'package:well_path/features/onboarding/food/get_food_use_case/get_food_use_case.dart';
import 'package:well_path/features/onboarding/food/models/food_state.dart';
import 'package:well_path/features/onboarding/food/network/request/food_request.dart';
import 'package:well_path/features/onboarding/food/network/response/food_response.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit(this._foodUseCase, this._getFoodUseCase, this._getFoodListUseCase)
      : super(const FoodState());

  final FoodUseCase _foodUseCase;
  final GetFoodUseCase _getFoodUseCase;
  final GetFoodListUseCase _getFoodListUseCase;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<FoodNavigation>.broadcast();
  S<FoodNavigation> get navigation => _navigation.stream;

  final _homeCookedMeal = SController<int?>.broadcast();
  S<int?> get homeCookedMeal => _homeCookedMeal.stream;

  final _palmSizedMeal = SController<int?>.broadcast();
  S<int?> get palmSizedMeal => _palmSizedMeal.stream;

  final _alcoholicBeverage = SController<int?>.broadcast();
  S<int?> get alcoholicBeverage => _alcoholicBeverage.stream;

  FoodState _foodState = const FoodState();

  Future<void> save() async {
    _loader.sink.add(true);
    final response = await _foodUseCase(
      FoodRequest(
          cookOwnFood: state.cookOwnFood,
          eatAtHome: state.eatAtHome,
          homeCookedFoodQuantity: state.homeCookedFoodQuantity,
          feelFull: state.feelFull,
          averageMealHealthy: state.averageMealHealthy,
          feelGuilty: state.feelGuilty,
          noOfPortionsPerDay: state.noOfPortionsPerDay,
          healthyFoodIds: state.selectedHealthyFoods,
          unhealthyFoodIds: state.selectedUnhealthyFoods,
          consumeAlcohol: state.consumeAlcohol,
          alcoholQuantity: state.alcoholQuantity),
    );

    _loader.sink.add(false);
    //_enableNext();

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final foodResponse = response.asValue!.value;
      _foodState = state.copyWith(
          cookOwnFood: foodResponse.cookOwnFood,
          eatAtHome: foodResponse.eatAtHome,
          homeCookedFoodQuantity: foodResponse.homeCookedFoodQuantity,
          feelFull: foodResponse.feelFull,
          feelGuilty: foodResponse.feelGuilty,
          selectedHealthyFoods: foodResponse.healthyFoodIds,
          selectedUnhealthyFoods: foodResponse.unhealthyFoodIds,
          averageMealHealthy: foodResponse.averageMealHealthy,
          noOfPortionsPerDay: foodResponse.noOfPortionsPerDay,
          consumeAlcohol: foodResponse.consumeAlcohol,
          alcoholQuantity: foodResponse.alcoholQuantity);

      _navigation.sink.add(FoodNavigation.sleep);
      return emit(_foodState);
    }
  }

  Future<void> getFoodList() async {
    _loader.sink.add(true);
    // _enableNext(isLoading: true);
    final response = await _getFoodListUseCase(nothing);
    //  _enableNext();
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        final foodListResponse = response.asValue!.value;
        getFood(foodListResponse);
      }
    } catch (e) {
      _loader.sink.add(false);
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  Future<void> getFood(FoodListResponse foodListResponse) async {
    final response = await _getFoodUseCase(nothing);

    // _enableNext();
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        _loader.sink.add(false);
        final foodResponse = response.asValue!.value;

        List<FoodItem> healthyFoodItems = [];
        List<FoodItem> unhealthyFoodItems = [];

        for (var healthyFoodItem in foodListResponse.healthyFoodList) {
          var isSelected =
              foodResponse.healthyFoodIds.contains(healthyFoodItem.id);
          healthyFoodItems.add(FoodItem(
              id: healthyFoodItem.id,
              title: healthyFoodItem.title,
              isHealthy: isSelected));
        }

        for (var unHealthyFoodItem in foodListResponse.unhealthyFoodList) {
          var isSelected =
              foodResponse.unhealthyFoodIds.contains(unHealthyFoodItem.id);
          unhealthyFoodItems.add(FoodItem(
              id: unHealthyFoodItem.id,
              title: unHealthyFoodItem.title,
              isHealthy: isSelected));
        }

        _homeCookedMeal.sink.add(foodResponse.homeCookedFoodQuantity ?? 0);
        _palmSizedMeal.sink.add(foodResponse.noOfPortionsPerDay ?? 0);
        _alcoholicBeverage.sink.add(foodResponse.alcoholQuantity ?? 0);

        _foodState = state.copyWith(
            cookOwnFood: foodResponse.cookOwnFood,
            eatAtHome: foodResponse.eatAtHome,
            homeCookedFoodQuantity: foodResponse.homeCookedFoodQuantity,
            feelFull: foodResponse.feelFull,
            averageMealHealthy: foodResponse.averageMealHealthy,
            noOfPortionsPerDay: foodResponse.noOfPortionsPerDay,
            healthyFoodIds: healthyFoodItems,
            selectedHealthyFoods: foodResponse.healthyFoodIds,
            unhealthyFoodIds: unhealthyFoodItems,
            feelGuilty: foodResponse.feelGuilty,
            selectedUnhealthyFoods: foodResponse.unhealthyFoodIds,
            consumeAlcohol: foodResponse.consumeAlcohol,
            alcoholQuantity: foodResponse.alcoholQuantity);
        return emit(_foodState);
      }
    } catch (e) {
      _loader.sink.add(false);
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  void updateHealthyFoodItem(int index, int healthyFoodId) {
    List<FoodItem> newListFoodItem = [];
    List<int> newSelectedHealthyFoodItem = [];

    for (var i = 0; i < state.healthyFoodIds.length; i++) {
      newListFoodItem.add(FoodItem(
          id: state.healthyFoodIds[i].id,
          title: state.healthyFoodIds[i].title,
          isHealthy: i == index
              ? !state.healthyFoodIds[i].isHealthy
              : state.healthyFoodIds[i].isHealthy));
    }

    for (var i = 0; i < state.selectedHealthyFoods.length; i++) {
      newSelectedHealthyFoodItem.add(state.selectedHealthyFoods[i].toInt());
    }
    newSelectedHealthyFoodItem = newSelectedHealthyFoodItem.toSet().toList();

    if (state.selectedHealthyFoods.contains(healthyFoodId)) {
      newSelectedHealthyFoodItem.remove(healthyFoodId);
    } else {
      newSelectedHealthyFoodItem.add(healthyFoodId);
    }

    emit(state.copyWith(
        healthyFoodIds: newListFoodItem,
        selectedHealthyFoods: newSelectedHealthyFoodItem));
  }

  void updateUnHealthyFoodItem(int index, int unhealthyFoodId) {
    List<FoodItem> newListFoodItem = [];
    List<int> newUnSelectedHealthyFoodItem = [];

    for (var i = 0; i < state.unhealthyFoodIds.length; i++) {
      newListFoodItem.add(FoodItem(
          id: state.unhealthyFoodIds[i].id,
          title: state.unhealthyFoodIds[i].title,
          isHealthy: i == index
              ? !state.unhealthyFoodIds[i].isHealthy
              : state.unhealthyFoodIds[i].isHealthy));
    }

    for (var i = 0; i < state.selectedUnhealthyFoods.length; i++) {
      newUnSelectedHealthyFoodItem.add(state.selectedUnhealthyFoods[i].toInt());
    }

    newUnSelectedHealthyFoodItem =
        newUnSelectedHealthyFoodItem.toSet().toList();
    if (state.selectedUnhealthyFoods.contains(unhealthyFoodId)) {
      newUnSelectedHealthyFoodItem.remove(unhealthyFoodId);
    } else {
      newUnSelectedHealthyFoodItem.add(unhealthyFoodId);
    }

    emit(state.copyWith(
        unhealthyFoodIds: newListFoodItem,
        selectedUnhealthyFoods: newUnSelectedHealthyFoodItem));
  }

  void onChangeHomeCookedMeals(int homeFoodQuantity) {
    emit(state.copyWith(homeCookedFoodQuantity: homeFoodQuantity));
  }

  void onChangePalmSized(int palmSizedQuantity) {
    emit(state.copyWith(noOfPortionsPerDay: palmSizedQuantity));
  }

  void onChangeAlcoholicBeverage(int alcoholicBeverageQuantiy) {
    emit(state.copyWith(alcoholQuantity: alcoholicBeverageQuantiy));
  }

  void onClickChangeDoCookOwnFood(bool isSelected) {
    emit(state.copyWith(cookOwnFood: isSelected));
  }

  void onClickChangeDoEatAtHome(bool isSelected) {
    emit(state.copyWith(eatAtHome: isSelected));
  }

  void onClickChangeDoFeelFull(bool isSelected) {
    emit(state.copyWith(feelFull: isSelected));
  }

  void onClickChangeDoAverageMealAshealthy(bool isSelected) {
    emit(state.copyWith(averageMealHealthy: isSelected));
  }

  void onClickChangeDoFeelGuilty(bool isSelected) {
    emit(state.copyWith(feelGuilty: isSelected));
  }

  void onClickChangeDoConsumeAlcohol(bool isSelected) {
    emit(state.copyWith(consumeAlcohol: isSelected));
  }

  @override
  Future<void> close() {
    _navigation.close();
    _loader.close();
    _message.close();
    _homeCookedMeal.close();
    _palmSizedMeal.close();
    _alcoholicBeverage.close();
    return super.close();
  }
}
