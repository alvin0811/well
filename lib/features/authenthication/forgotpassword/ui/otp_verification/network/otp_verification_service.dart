import 'package:chopper/chopper.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/network/request/forgot_password_request.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/network/response/forgot_password_response.dart';
import 'package:well_path/helper/helpers.dart';
import 'request/otp_verification_request.dart';
import 'response/otp_verification_response.dart';

part 'otp_verification_service.chopper.dart';

abstract class OtpVerificationService {
  Future<Response<OtpVerificationResponse>> otpVerification(
    @Body() OtpVerificationRequest request,
  );

  Future<Response<ForgotPasswordResponse>> forgetPassword(
    @Body() ForgotPasswordRequest request,
  );
}

typedef FPService = OtpVerificationService;

@ChopperApi()
abstract class DefaultOtpVerificationService extends CS implements FPService {
  static DefaultOtpVerificationService create() =>
      _$DefaultOtpVerificationService();

  @Post(path: 'v1/auth/forgot-password/verification')
  @override
  Future<Response<OtpVerificationResponse>> otpVerification(
    @Body() OtpVerificationRequest request,
  );

  @Post(path: 'v1/auth/forgot-password')
  @override
  Future<Response<ForgotPasswordResponse>> forgetPassword(
    @Body() ForgotPasswordRequest request,
  );
}
