import 'package:chopper/chopper.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/network/request/setting_reset_password_request.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/network/response/setting_reset_password_response.dart';
import 'package:well_path/helper/helpers.dart';

part 'setting_reset_password_service.chopper.dart';

abstract class SettingResetPasswordService {
  Future<Response<SettingResetPasswordResponse>> resetPassword(
    @Body() SettingResetPasswordRequest request,
  );
}

typedef FPService = SettingResetPasswordService;

@ChopperApi()
abstract class DefaultSettingResetPasswordService extends CS
    implements FPService {
  static DefaultSettingResetPasswordService create() =>
      _$DefaultSettingResetPasswordService();

  @Post(path: 'v1/auth/reset-password')
  @override
  Future<Response<SettingResetPasswordResponse>> resetPassword(
    @Body() SettingResetPasswordRequest request,
  );
}
