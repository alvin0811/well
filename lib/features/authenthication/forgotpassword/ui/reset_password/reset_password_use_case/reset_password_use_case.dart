import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/network/request/reset_password_request.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/network/reset_password_service.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/network/response/reset_password_response.dart';

class ResetPasswordUseCase
    extends UseCase<ResetPasswordRequest, ResetPasswordResponse> {
  ResetPasswordUseCase(this._resetPasswordService);

  final ResetPasswordService _resetPasswordService;

  @override
  Future<Response<ResetPasswordResponse>> execute(ResetPasswordRequest params) {
    return _resetPasswordService.resetPassword(params);
  }
}
