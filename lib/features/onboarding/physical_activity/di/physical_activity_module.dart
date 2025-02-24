import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/onboarding/physical_activity/cubit/physical_activity_cubit.dart';
import 'package:well_path/features/onboarding/physical_activity/get_disablilities_use_case/get_disablilities_use_case.dart';
import 'package:well_path/features/onboarding/physical_activity/get_physical_activity_use_case/get_physical_activity_use_case.dart';
import 'package:well_path/features/onboarding/physical_activity/network/physical_activity_service.dart';
import 'package:well_path/features/onboarding/physical_activity/physical_activity_use_case/physical_activity_use_case.dart';

void setupPhysicalActivityModule() {
  getIt
    ..registerFactory<PhysicalActivityCubit>(() => PhysicalActivityCubit(
          getIt<GetDisabilitiesUseCase>(),
          getIt<GetPhysicalActivityUseCase>(),
          getIt<PhysicalActivityUseCase>(),
        ))
    ..registerSingleton<PhysicalActivityService>(
      getIt<NetworkClient>()
          .client
          .getService<DefaultPhysicalActivityService>(),
    )
    ..registerFactory<GetDisabilitiesUseCase>(
      () => GetDisabilitiesUseCase(getIt<PhysicalActivityService>()),
    )
    ..registerFactory<GetPhysicalActivityUseCase>(
      () => GetPhysicalActivityUseCase(getIt<PhysicalActivityService>()),
    )
    ..registerFactory<PhysicalActivityUseCase>(
      () => PhysicalActivityUseCase(getIt<PhysicalActivityService>()),
    );
}
