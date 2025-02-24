import 'package:chopper/chopper.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/network/response/change_password_response.dart';
import 'package:well_path/helper/helpers.dart';

part 'change_password_service.chopper.dart';

abstract class ChangePasswordService {
  Future<Response<ChangePasswordResponse>> changePassword();
}

typedef FPService = ChangePasswordService;

@ChopperApi()
abstract class DefaultChangePasswordService extends CS implements FPService {
  static DefaultChangePasswordService create() =>
      _$DefaultChangePasswordService();

  @Post(path: 'v1/auth/change-password/request')
  @override
  Future<Response<ChangePasswordResponse>> changePassword();
}
