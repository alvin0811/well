import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:chopper/chopper.dart';
import 'package:well_path/features/onboarding/stress/network/response/stress_list_response.dart';
import 'package:well_path/features/onboarding/stress/network/stress_service.dart';
import 'package:well_path/features/settings/network/delete_user_response.dart';
import 'package:well_path/features/settings/network/setting_service.dart';

class DeleteUserUseCase extends UseCase<Nothing, DeleteUserResponse> {
  DeleteUserUseCase(this._settingService);

  final SettingService _settingService;

  @override
  Future<Response<DeleteUserResponse>> execute(Nothing params) {
    return _settingService.deleteUser();
  }
}
