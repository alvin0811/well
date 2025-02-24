import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/features/onboarding/stress/cubit/stress_cubit.dart';
import 'package:well_path/features/onboarding/stress/get_stress_list_use_case/get_stress_list_use_case.dart';
import 'package:well_path/features/onboarding/stress/get_stress_use_case/get_stress_use_case.dart';
import 'package:well_path/features/onboarding/stress/network/stress_service.dart';
import 'package:well_path/features/onboarding/stress/stress_use_case/stress_use_case.dart';

import '../../../../di/locator/service_locator.dart';

void setupStressModule() {
  getIt
    ..registerFactory<StressCubit>(() => StressCubit(
          getIt<GetStressListUseCase>(),
          getIt<GetStressUseCase>(),
          getIt<StressUseCase>(),
        ))
    ..registerSingleton<StressService>(
      getIt<NetworkClient>().client.getService<DefaultStressService>(),
    )
    ..registerFactory<GetStressListUseCase>(
      () => GetStressListUseCase(getIt<StressService>()),
    )
    ..registerFactory<GetStressUseCase>(
      () => GetStressUseCase(getIt<StressService>()),
    )
    ..registerFactory<StressUseCase>(
      () => StressUseCase(getIt<StressService>()),
    );
}
