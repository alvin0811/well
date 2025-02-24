import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/change_password_otp_usecase/change_password_otp_usecase.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/cubit/change_password_otp_cubit.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/network/change_password_otp_service.dart';

void setupChangePasswordOtpModule() {
  getIt
    ..registerFactoryParam<ChangePasswordOtpCubit, String, dynamic>(
      ((token, _) => ChangePasswordOtpCubit(
          getIt<ChangePasswordOtpUseCase>(), getIt<AuthStore>(), token)),
    )
    ..registerSingleton<ChangePasswordOtpService>(
      getIt<NetworkClient>()
          .client
          .getService<DefaultChangePasswordOtpService>(),
    )
    ..registerFactory<ChangePasswordOtpUseCase>(
      () => ChangePasswordOtpUseCase(getIt<ChangePasswordOtpService>()),
    );
}
