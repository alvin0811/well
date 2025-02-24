import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/cubit/forgot_password_cubit.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/forgot_password_usecase/forgot_password_use_case.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/network/forgot_password_service.dart';

void setupForgotPasswordModule() {
  getIt
    ..registerFactory<ForgotPasswordCubit>(
      () => ForgotPasswordCubit(
        getIt<ForgotPasswordUseCase>(),
        getIt<AuthStore>(),
      ),
    )
    ..registerSingleton<ForgotPasswordService>(
      getIt<NetworkClient>().client.getService<DefaultForgotPasswordService>(),
    )
    ..registerFactory<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(getIt<ForgotPasswordService>()),
    );
}
