import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/injectable.dart';
import 'package:well_path/features/onboarding/food/cubit/food_cubit.dart';
import 'package:well_path/features/onboarding/food/food_use_case/food_use_case.dart';
import 'package:well_path/features/onboarding/food/get_food_list_use_case/get_food_list_use_case.dart';
import 'package:well_path/features/onboarding/food/get_food_use_case/get_food_use_case.dart';
import 'package:well_path/features/onboarding/food/network/food_service.dart';

void setupFoodModule() {
  getIt
    ..registerFactory<FoodCubit>(() => FoodCubit(
          getIt<FoodUseCase>(),
          getIt<GetFoodUseCase>(),
          getIt<GetFoodListUseCase>(),
        ))
    ..registerSingleton<FoodService>(
      getIt<NetworkClient>().client.getService<DefaultFoodService>(),
    )
    ..registerFactory<FoodUseCase>(
      () => FoodUseCase(getIt<FoodService>()),
    )
    ..registerFactory<GetFoodUseCase>(
      () => GetFoodUseCase(getIt<FoodService>()),
    )
    ..registerFactory<GetFoodListUseCase>(
      () => GetFoodListUseCase(getIt<FoodService>()),
    );
}
