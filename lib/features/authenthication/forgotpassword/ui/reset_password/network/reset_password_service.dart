import 'package:chopper/chopper.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/network/request/reset_password_request.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/network/response/reset_password_response.dart';
import 'package:well_path/helper/helpers.dart';

part 'reset_password_service.chopper.dart';

abstract class ResetPasswordService {
  Future<Response<ResetPasswordResponse>> resetPassword(
      @Body() ResetPasswordRequest request);
}

@ChopperApi()
abstract class DefaultResetPasswordService extends CS
    implements ResetPasswordService {
  static DefaultResetPasswordService create() =>
      _$DefaultResetPasswordService();

  @Post(path: 'v1/auth/reset-password')
  @override
  Future<Response<ResetPasswordResponse>> resetPassword(
      @Body() ResetPasswordRequest request);
}
