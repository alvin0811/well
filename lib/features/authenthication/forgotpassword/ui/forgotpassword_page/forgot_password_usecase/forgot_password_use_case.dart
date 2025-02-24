import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/network/forgot_password_service.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/network/request/forgot_password_request.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/network/response/forgot_password_response.dart';

typedef ForgotUseCase = UseCase<ForgotPasswordRequest, ForgotPasswordResponse>;

class ForgotPasswordUseCase extends ForgotUseCase {
  ForgotPasswordUseCase(this._forgotPasswordService);

  final ForgotPasswordService _forgotPasswordService;

  @override
  Future<Response<ForgotPasswordResponse>> execute(
    ForgotPasswordRequest params,
  ) {
    return _forgotPasswordService.forgetPassword(params);
  }
}
