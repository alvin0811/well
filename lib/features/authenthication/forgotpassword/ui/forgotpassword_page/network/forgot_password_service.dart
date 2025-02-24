import 'package:chopper/chopper.dart';
import 'package:well_path/helper/helpers.dart';

import 'request/forgot_password_request.dart';
import 'response/forgot_password_response.dart';

part 'forgot_password_service.chopper.dart';

abstract class ForgotPasswordService {
  Future<Response<ForgotPasswordResponse>> forgetPassword(
    @Body() ForgotPasswordRequest request,
  );
}

typedef FPService = ForgotPasswordService;

@ChopperApi()
abstract class DefaultForgotPasswordService extends CS implements FPService {
  static DefaultForgotPasswordService create() =>
      _$DefaultForgotPasswordService();

  @Post(path: 'v1/auth/forgot-password')
  @override
  Future<Response<ForgotPasswordResponse>> forgetPassword(
    @Body() ForgotPasswordRequest request,
  );
}
