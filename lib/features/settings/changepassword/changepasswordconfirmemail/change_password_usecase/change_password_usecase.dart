import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/network/change_password_service.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/network/response/change_password_response.dart';

typedef ChangeUseCase = UseCase<Nothing, ChangePasswordResponse>;

class ChangePasswordUseCase extends ChangeUseCase {
  ChangePasswordUseCase(this._changePasswordService);

  final ChangePasswordService _changePasswordService;

  @override
  Future<Response<ChangePasswordResponse>> execute(Nothing params) {
    return _changePasswordService.changePassword();
  }
}
