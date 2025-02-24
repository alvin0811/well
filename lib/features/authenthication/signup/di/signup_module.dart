import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/injectable.dart';
import 'package:well_path/features/authenthication/signup/cubit/signup_cubit.dart';
import 'package:well_path/features/authenthication/signup/network/signup_service.dart';
import 'package:well_path/features/authenthication/signup/signup_user_use_case/signup_user_use_case.dart';

void setupSignUpModule() {
  getIt
    ..registerFactory<SignupCubit>(
      () => SignupCubit(
        getIt<SignUpUseCase>(),
        getIt<AuthStore>(),
      ),
    )
    ..registerSingleton<SignUpService>(
      getIt<NetworkClient>().client.getService<DefaultSignUpService>(),
    )
    ..registerFactory<SignUpUseCase>(
      () => SignUpUseCase(getIt<SignUpService>()),
    );
}
