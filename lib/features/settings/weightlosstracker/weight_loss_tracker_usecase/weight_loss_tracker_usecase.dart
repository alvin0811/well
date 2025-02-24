import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/settings/weightlosstracker/network/response/weight_loss_settings_response.dart';
import 'package:well_path/features/settings/weightlosstracker/network/weight_loss_setting_service.dart';

class WeightLossSettingUseCase
    extends UseCase<Nothing, WeightLossSettingResponse> {
  WeightLossSettingUseCase(this._weightLossSettingService);

  final WeightLossSettingService _weightLossSettingService;

  @override
  Future<Response<WeightLossSettingResponse>> execute(Nothing params) {
    return _weightLossSettingService.getBmiCalculation();
  }
}
