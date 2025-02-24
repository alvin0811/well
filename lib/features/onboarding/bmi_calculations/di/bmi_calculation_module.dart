import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/onboarding/bmi_calculations/bmi_calculation_use_case/bmi_calculation_use_case.dart';
import 'package:well_path/features/onboarding/bmi_calculations/cubit/bmi_calculation_cubit.dart';
import 'package:well_path/features/onboarding/bmi_calculations/get_bmi_calculation_use_case/get_bmi_calculation_use_case.dart';
import 'package:well_path/features/onboarding/bmi_calculations/network/bmi_calculation_service.dart';

void setupBmiCalculationModule() {
  getIt
    ..registerFactory<BmiCalculationCubit>(() => BmiCalculationCubit(
          getIt<BmiCalculationUseCase>(),
          getIt<GetBmiCalculationUseCase>(),
        ))
    ..registerSingleton<BmiCalculationService>(
      getIt<NetworkClient>().client.getService<DefaultBmiCalculationService>(),
    )
    ..registerFactory<BmiCalculationUseCase>(
      () => BmiCalculationUseCase(getIt<BmiCalculationService>()),
    )
    ..registerFactory<GetBmiCalculationUseCase>(
      () => GetBmiCalculationUseCase(getIt<BmiCalculationService>()),
    );
}
