import 'package:chopper/chopper.dart';
import 'package:well_path/features/onboarding/stress/network/request/stress_request.dart';
import 'package:well_path/features/onboarding/stress/network/response/stress_list_response.dart';
import 'package:well_path/features/onboarding/stress/network/response/stress_response.dart';
import 'package:well_path/features/settings/network/delete_user_response.dart';
import 'package:well_path/helper/helpers.dart';

part 'setting_service.chopper.dart';

abstract class SettingService {
  Future<Response<DeleteUserResponse>> deleteUser();
}

@ChopperApi()
abstract class DefaultSettingService extends CS implements SettingService {
  static DefaultSettingService create() => _$DefaultSettingService();

  @Delete(path: 'v1/user')
  @override
  Future<Response<DeleteUserResponse>> deleteUser();
}
