import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/food/network/food_service.dart';
import 'package:well_path/features/onboarding/food/network/response/food_response.dart';

class GetFoodListUseCase extends UseCase<Nothing, FoodListResponse> {
  GetFoodListUseCase(this._foodService);

  final FoodService _foodService;

  @override
  Future<Response<FoodListResponse>> execute(Nothing params) {
    return _foodService.getFoodList();
  }
}
