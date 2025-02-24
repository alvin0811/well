import 'package:chopper/chopper.dart';
import 'package:well_path/features/onboarding/bmi_calculations/network/request/bmi_calculation_request.dart';
import 'package:well_path/features/onboarding/bmi_calculations/network/response/bmi_calculation_response.dart';

import 'package:well_path/helper/helpers.dart';

part 'bmi_calculation_service.chopper.dart';

abstract class BmiCalculationService {
  Future<Response<BmiCalculationResponse>> bmiCalculation(
      @Body() BmiCalculationRequest request);
  Future<Response<BmiCalculationResponse>> getBmiCalculation();
}

@ChopperApi()
abstract class DefaultBmiCalculationService extends CS
    implements BmiCalculationService {
  static DefaultBmiCalculationService create() =>
      _$DefaultBmiCalculationService();

  @Put(path: 'v1/bmi')
  @override
  Future<Response<BmiCalculationResponse>> bmiCalculation(
      @Body() BmiCalculationRequest request);

  @Get(path: 'v1/bmi')
  @override
  Future<Response<BmiCalculationResponse>> getBmiCalculation();
}
