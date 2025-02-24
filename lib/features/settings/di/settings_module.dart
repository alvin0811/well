import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/onboarding/stress/network/stress_service.dart';
import 'package:well_path/features/settings/cubit/settings_cubit.dart';
import 'package:well_path/features/settings/delete_user_use_case/delete_user_use_case.dart';
import 'package:well_path/features/settings/network/setting_service.dart';

void setupSettingModule() {
  getIt
    ..registerFactory<SettingCubit>(
      () => SettingCubit(
        getIt<AuthStore>(),
        getIt<DeleteUserUseCase>(),
      ),
    )
    ..registerSingleton<SettingService>(
      getIt<NetworkClient>().client.getService<DefaultSettingService>(),
    )
    ..registerFactory<DeleteUserUseCase>(
      () => DeleteUserUseCase(getIt<SettingService>()),
    );
}

// ..registerFactory<StressCubit>(() => StressCubit(
//           getIt<GetStressListUseCase>(),
//           getIt<GetStressUseCase>(),
//           getIt<StressUseCase>(),
//         ))
//     ..registerSingleton<StressService>(
//       getIt<NetworkClient>().client.getService<DefaultStressService>(),
//     )
//     ..registerFactory<GetStressListUseCase>(
//       () => GetStressListUseCase(getIt<StressService>()),
//     )
//     ..registerFactory<GetStressUseCase>(
//       () => GetStressUseCase(getIt<StressService>()),
//     )