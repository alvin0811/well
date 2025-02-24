import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/forgot_password_usecase/forgot_password_use_case.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/network/request/forgot_password_request.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/network/response/forgot_password_response.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/network/otp_verification_service.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/network/request/otp_verification_request.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/network/response/otp_verification_response.dart';

typedef VerificationUseCase
    = UseCase<OtpVerificationRequest, OtpVerificationResponse>;

class OtpVerificationUseCase extends VerificationUseCase {
  OtpVerificationUseCase(this._otpVerificationService);

  final OtpVerificationService _otpVerificationService;

  @override
  Future<Response<OtpVerificationResponse>> execute(
    OtpVerificationRequest params,
  ) {
    return _otpVerificationService.otpVerification(params);
  }
}

class OtpResendUseCase extends ForgotUseCase {
  OtpResendUseCase(this._otpVerificationService);

  final OtpVerificationService _otpVerificationService;

  @override
  Future<Response<ForgotPasswordResponse>> execute(
      ForgotPasswordRequest params) {
    return _otpVerificationService.forgetPassword(params);
  }
}
