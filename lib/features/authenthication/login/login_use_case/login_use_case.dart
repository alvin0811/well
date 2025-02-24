import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/authenthication/login/network/login_service.dart';
import 'package:well_path/features/authenthication/login/network/request/login_request.dart';
import 'package:well_path/features/authenthication/login/network/response/login_response.dart';

class LoginUseCase extends UseCase<LoginRequest, LoginResponse> {
  LoginUseCase(this._loginService);

  final LoginService _loginService;

  @override
  Future<Response<LoginResponse>> execute(LoginRequest params) {
    return _loginService.login(params);
  }
}
