import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/cubit/setting_reset_password_cubit.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/network/setting_reset_password_service.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/setting_reset_password/setting_reset_password_usecase.dart';

void setupSettingResetPasswordModule() {
  getIt
    ..registerFactoryParam<SettingResetPasswordCubit, String, dynamic>(
      ((token, _) => SettingResetPasswordCubit(
          getIt<SettingResetPasswordUseCase>(), getIt<AuthStore>(), token)),
    )
    ..registerSingleton<SettingResetPasswordService>(
      getIt<NetworkClient>()
          .client
          .getService<DefaultSettingResetPasswordService>(),
    )
    ..registerFactory<SettingResetPasswordUseCase>(
      () => SettingResetPasswordUseCase(getIt<SettingResetPasswordService>()),
    );
}
