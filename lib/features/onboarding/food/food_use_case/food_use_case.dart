import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/food/network/food_service.dart';
import 'package:well_path/features/onboarding/food/network/request/food_request.dart';
import 'package:well_path/features/onboarding/food/network/response/food_response.dart';

class FoodUseCase extends UseCase<FoodRequest, FoodResponse> {
  FoodUseCase(this._foodService);

  final FoodService _foodService;

  @override
  Future<Response<FoodResponse>> execute(FoodRequest params) {
    return _foodService.food(params);
  }
}
