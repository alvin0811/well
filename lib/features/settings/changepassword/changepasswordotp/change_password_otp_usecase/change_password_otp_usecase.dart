import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/network/change_password_otp_service.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/network/request/change_password_otp_request.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/network/response/change_password_otp_response.dart';

typedef ChangeUseCase
    = UseCase<ChangePasswordOtpRequest, ChangePasswordOtpResponse>;

class ChangePasswordOtpUseCase extends ChangeUseCase {
  ChangePasswordOtpUseCase(this._changePasswordOtpService);

  final ChangePasswordOtpService _changePasswordOtpService;

  @override
  Future<Response<ChangePasswordOtpResponse>> execute(
    ChangePasswordOtpRequest params,
  ) {
    return _changePasswordOtpService.changeOtpPassword(params);
  }
}
