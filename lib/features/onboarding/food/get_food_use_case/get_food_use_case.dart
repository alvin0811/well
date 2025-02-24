import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/food/network/food_service.dart';
import 'package:well_path/features/onboarding/food/network/response/food_response.dart';

class GetFoodUseCase extends UseCase<Nothing, FoodResponse> {
  GetFoodUseCase(this._foodService);

  final FoodService _foodService;

  @override
  Future<Response<FoodResponse>> execute(Nothing params) {
    return _foodService.getFoods();
  }
}
