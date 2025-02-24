import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/authenthication/login_with_touch/network/login_with_touch_id_service.dart';
import 'package:well_path/features/authenthication/login_with_touch/network/request/login_with_touch_id_request.dart';
import 'package:well_path/features/authenthication/login_with_touch/network/response/login_with_touch_id_response.dart';

class LoginWithTouchIdUseCase
    extends UseCase<LoginWithTouchIdRequest, LoginWithTouchIdResponse> {
  LoginWithTouchIdUseCase(this._loginWithTouchIdService);

  final LoginWithTouchIdService _loginWithTouchIdService;

  @override
  Future<Response<LoginWithTouchIdResponse>> execute(
      LoginWithTouchIdRequest params) {
    return _loginWithTouchIdService.login(params);
  }
}
