import 'package:chopper/chopper.dart';
import 'package:well_path/features/authenthication/signup/network/response/sign_up_response.dart';
import 'package:well_path/helper/helpers.dart';

import 'request/sign_up_request.dart';

part 'signup_service.chopper.dart';

abstract class SignUpService {
  Future<Response<SignUpResponse>> signup(@Body() SignUpRequest request);
}

@ChopperApi()
abstract class DefaultSignUpService extends CS implements SignUpService {
  static DefaultSignUpService create() => _$DefaultSignUpService();

  @Post(path: 'v1/auth/signup')
  @override
  Future<Response<SignUpResponse>> signup(@Body() SignUpRequest request);
}
