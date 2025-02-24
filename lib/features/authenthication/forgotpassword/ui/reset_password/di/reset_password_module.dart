import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/injectable.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/cubit/reset_password_cubit.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/network/reset_password_service.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/reset_password_use_case/reset_password_use_case.dart';

void setupResetPasswordModule() {
  getIt
    ..registerFactory<ResetPasswordCubit>(
      () => ResetPasswordCubit(
        getIt<ResetPasswordUseCase>(),
        getIt<AuthStore>(),
      ),
    )
    ..registerSingleton<ResetPasswordService>(
      getIt<NetworkClient>().client.getService<DefaultResetPasswordService>(),
    )
    ..registerFactory<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(getIt<ResetPasswordService>()),
    );
}
