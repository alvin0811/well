import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/authenthication/signup/network/request/sign_up_request.dart';
import 'package:well_path/features/authenthication/signup/network/signup_service.dart';

import '../network/response/sign_up_response.dart';

typedef SignupUC = UseCase<SignUpRequest, SignUpResponse>;

class SignUpUseCase extends SignupUC {
  SignUpUseCase(this._signUpService);
  final SignUpService _signUpService;

  @override
  Future<Response<SignUpResponse>> execute(SignUpRequest params) async {
    return _signUpService.signup(params);
  }
}
