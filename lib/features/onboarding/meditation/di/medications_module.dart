import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/onboarding/meditation/cubit/medications_cubit.dart';
import 'package:well_path/features/onboarding/meditation/get_medications_list_use_case/get_medications_list_use_case.dart';
import 'package:well_path/features/onboarding/meditation/get_medications_use_case/get_medications_use_case.dart';
import 'package:well_path/features/onboarding/meditation/medications_use_case/medications_use_case.dart';
import 'package:well_path/features/onboarding/meditation/network/medications_service.dart';

void setupMeditationModule() {
  getIt
    ..registerFactory<MeditationCubit>(() => MeditationCubit(
          getIt<MeditationUseCase>(),
          getIt<GetMeditationUseCase>(),
          getIt<GetMeditationListUseCase>(),
        ))
    ..registerSingleton<MeditationService>(
      getIt<NetworkClient>().client.getService<DefaultMeditationService>(),
    )
    ..registerFactory<MeditationUseCase>(
      () => MeditationUseCase(getIt<MeditationService>()),
    )
    ..registerFactory<GetMeditationUseCase>(
      () => GetMeditationUseCase(getIt<MeditationService>()),
    )
    ..registerFactory<GetMeditationListUseCase>(
      () => GetMeditationListUseCase(getIt<MeditationService>()),
    );
}
