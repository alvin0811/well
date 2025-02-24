import 'package:chopper/chopper.dart';
import 'package:well_path/features/settings/weightlosstracker/network/response/weight_loss_settings_response.dart';

import 'package:well_path/helper/helpers.dart';

part 'weight_loss_setting_service.chopper.dart';

abstract class WeightLossSettingService {
  Future<Response<WeightLossSettingResponse>> getBmiCalculation();
}

@ChopperApi()
abstract class DefaultWeightLossSettingService extends CS
    implements WeightLossSettingService {
  static DefaultWeightLossSettingService create() =>
      _$DefaultWeightLossSettingService();

  @Get(path: 'v1/bmi')
  @override
  Future<Response<WeightLossSettingResponse>> getBmiCalculation();
}
