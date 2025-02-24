import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/onboarding/demographics/cubit/demographics_cubit.dart';
import 'package:well_path/features/onboarding/demographics/demographics_use_case/demographics_use_case.dart';
import 'package:well_path/features/onboarding/demographics/get_demographics_use_case/get_demographics_use_case.dart';
import 'package:well_path/features/onboarding/demographics/network/demographics_service.dart';

void setupDemographicModule() {
  getIt
    ..registerFactory<DemographicCubit>(() => DemographicCubit(
          getIt<AuthStore>(),
          getIt<DemographicUseCase>(),
          getIt<GetDemographicUseCase>(),
        ))
    ..registerSingleton<DemographicService>(
      getIt<NetworkClient>().client.getService<DefaultDemographicService>(),
    )
    ..registerFactory<DemographicUseCase>(
      () => DemographicUseCase(getIt<DemographicService>()),
    )
    ..registerFactory<GetDemographicUseCase>(
      () => GetDemographicUseCase(getIt<DemographicService>()),
    );
}
