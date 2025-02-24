import 'package:chopper/chopper.dart';
import 'package:well_path/features/authenthication/login_with_touch/network/request/login_with_touch_id_request.dart';
import 'package:well_path/features/authenthication/login_with_touch/network/response/login_with_touch_id_response.dart';

import 'package:well_path/helper/helpers.dart';

part 'login_with_touch_id_service.chopper.dart';

abstract class LoginWithTouchIdService {
  Future<Response<LoginWithTouchIdResponse>> login(
      @Body() LoginWithTouchIdRequest request);
}

@ChopperApi()
abstract class DefaultLoginWithTouchIdService extends CS
    implements LoginWithTouchIdService {
  static DefaultLoginWithTouchIdService create() =>
      _$DefaultLoginWithTouchIdService();

  @Post(path: 'v1/auth/login')
  @override
  Future<Response<LoginWithTouchIdResponse>> login(
      @Body() LoginWithTouchIdRequest request);
}
