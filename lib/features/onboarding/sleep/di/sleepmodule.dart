import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/onboarding/sleep/cubit/sleep_cubit.dart';
import 'package:well_path/features/onboarding/sleep/get_sleep_use_case/get_sleep_use_case.dart';
import 'package:well_path/features/onboarding/sleep/network/sleep_service.dart';
import 'package:well_path/features/onboarding/sleep/sleep_use_case/sleep_use_case.dart';

void setupSleepModule() {
  getIt
    ..registerFactory<SleepCubit>(() => SleepCubit(
          getIt<GetSleepUseCase>(),
          getIt<SleepUseCase>(),
        ))
    ..registerSingleton<SleepService>(
      getIt<NetworkClient>().client.getService<DefaultSleepService>(),
    )
    ..registerFactory<SleepUseCase>(
      () => SleepUseCase(getIt<SleepService>()),
    )
    ..registerFactory<GetSleepUseCase>(
      () => GetSleepUseCase(getIt<SleepService>()),
    );
}
