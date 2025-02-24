import 'package:chopper/chopper.dart';
import 'package:well_path/features/authenthication/login/network/request/login_request.dart';
import 'package:well_path/features/authenthication/login/network/response/login_response.dart';
import 'package:well_path/helper/helpers.dart';

part 'login_service.chopper.dart';

abstract class LoginService {
  Future<Response<LoginResponse>> login(@Body() LoginRequest request);
}

@ChopperApi()
abstract class DefaultLoginService extends CS implements LoginService {
  static DefaultLoginService create() => _$DefaultLoginService();

  @Post(path: 'v1/auth/login')
  @override
  Future<Response<LoginResponse>> login(@Body() LoginRequest request);
}
