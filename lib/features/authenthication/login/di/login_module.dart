import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/authenthication/login/cubit/login_cubit.dart';
import 'package:well_path/features/authenthication/login/login_use_case/login_use_case.dart';
import 'package:well_path/features/authenthication/login/network/login_service.dart';
import 'package:well_path/features/settings/editprofile/get_user_profile_usecase/get_user_profile_usecase.dart';

void setupLoginModule() {
  getIt
    ..registerFactory<LoginCubit>(() => LoginCubit(
          getIt<LoginUseCase>(),
          getIt<AuthStore>(),
          getIt<GetUserProfileUseCase>(),
        ))
    ..registerSingleton<LoginService>(
      getIt<NetworkClient>().client.getService<DefaultLoginService>(),
    )
    ..registerFactory<LoginUseCase>(
      () => LoginUseCase(getIt<LoginService>()),
    );
}
