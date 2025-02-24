import 'package:chopper/chopper.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/network/request/change_password_otp_request.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/network/response/change_password_otp_response.dart';
import 'package:well_path/helper/helpers.dart';

part 'change_password_otp_service.chopper.dart';

abstract class ChangePasswordOtpService {
  Future<Response<ChangePasswordOtpResponse>> changeOtpPassword(
    @Body() ChangePasswordOtpRequest request,
  );
}

typedef FPService = ChangePasswordOtpService;

@ChopperApi()
abstract class DefaultChangePasswordOtpService extends CS implements FPService {
  static DefaultChangePasswordOtpService create() =>
      _$DefaultChangePasswordOtpService();

  @Post(path: 'v1/auth/change-password/verification')
  @override
  Future<Response<ChangePasswordOtpResponse>> changeOtpPassword(
    @Body() ChangePasswordOtpRequest request,
  );
}
