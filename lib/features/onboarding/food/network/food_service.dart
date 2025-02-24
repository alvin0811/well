import 'package:chopper/chopper.dart';
import 'package:well_path/features/onboarding/food/network/response/food_response.dart';
import 'package:well_path/helper/helpers.dart';

import 'request/food_request.dart';

part 'food_service.chopper.dart';

abstract class FoodService {
  Future<Response<FoodResponse>> food(@Body() FoodRequest request);
  Future<Response<FoodResponse>> getFoods();
  Future<Response<FoodListResponse>> getFoodList();
}

@ChopperApi()
abstract class DefaultFoodService extends CS implements FoodService {
  static DefaultFoodService create() => _$DefaultFoodService();

  @Put(path: 'v1/food')
  @override
  Future<Response<FoodResponse>> food(@Body() FoodRequest request);

  @Get(path: 'v1/food')
  @override
  Future<Response<FoodResponse>> getFoods();

  @Get(path: 'v1/food/list')
  @override
  Future<Response<FoodListResponse>> getFoodList();
}
