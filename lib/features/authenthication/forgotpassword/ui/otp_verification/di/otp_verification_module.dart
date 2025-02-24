import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/injectable.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/cubit/otp_verification_cubit.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/network/otp_verification_service.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/otp_verification_use_case/otp_verification_use_case.dart';

void setupOtpVerificationModule() {
  getIt
    ..registerFactoryParam<OtpVerificationCubit, String, dynamic>(
      ((email, _) => OtpVerificationCubit(getIt<OtpVerificationUseCase>(),
          getIt<AuthStore>(), email, getIt<OtpResendUseCase>())),
    )
    ..registerSingleton<OtpVerificationService>(
      getIt<NetworkClient>().client.getService<DefaultOtpVerificationService>(),
    )
    ..registerFactory<OtpVerificationUseCase>(
      () => OtpVerificationUseCase(getIt<OtpVerificationService>()),
    )
    ..registerFactory<OtpResendUseCase>(
      () => OtpResendUseCase(getIt<OtpVerificationService>()),
    );
}
