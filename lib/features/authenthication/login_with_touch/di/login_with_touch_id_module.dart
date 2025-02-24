import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/authenthication/login_with_touch/cubit/login_with_touch_id_cubit.dart';
import 'package:well_path/features/authenthication/login_with_touch/login_with_touch_id_use_case/login_with_touch_id_use_case.dart';
import 'package:well_path/features/authenthication/login_with_touch/network/login_with_touch_id_service.dart';
import 'package:well_path/features/settings/editprofile/get_user_profile_usecase/get_user_profile_usecase.dart';

void setupLoginWithTouchIdModule() {
  getIt
    ..registerFactory<LoginWithTouchIdCubit>(() => LoginWithTouchIdCubit(
          getIt<LoginWithTouchIdUseCase>(),
          getIt<AuthStore>(),
          getIt<GetUserProfileUseCase>(),
        ))
    ..registerSingleton<LoginWithTouchIdService>(
      getIt<NetworkClient>()
          .client
          .getService<DefaultLoginWithTouchIdService>(),
    )
    ..registerFactory<LoginWithTouchIdUseCase>(
      () => LoginWithTouchIdUseCase(getIt<LoginWithTouchIdService>()),
    );
}
