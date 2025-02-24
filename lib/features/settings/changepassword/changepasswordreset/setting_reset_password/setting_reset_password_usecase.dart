import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/network/request/setting_reset_password_request.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/network/response/setting_reset_password_response.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/network/setting_reset_password_service.dart';

typedef ChangeUseCase
    = UseCase<SettingResetPasswordRequest, SettingResetPasswordResponse>;

class SettingResetPasswordUseCase extends ChangeUseCase {
  SettingResetPasswordUseCase(this._settingResetPasswordService);

  final SettingResetPasswordService _settingResetPasswordService;

  @override
  Future<Response<SettingResetPasswordResponse>> execute(
    SettingResetPasswordRequest params,
  ) {
    return _settingResetPasswordService.resetPassword(params);
  }
}
