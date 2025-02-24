import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/bmi_calculations/network/bmi_calculation_service.dart';
import 'package:well_path/features/onboarding/bmi_calculations/network/response/bmi_calculation_response.dart';

class GetBmiCalculationUseCase
    extends UseCase<Nothing, BmiCalculationResponse> {
  GetBmiCalculationUseCase(this._bmiCalculationService);

  final BmiCalculationService _bmiCalculationService;

  @override
  Future<Response<BmiCalculationResponse>> execute(Nothing params) {
    return _bmiCalculationService.getBmiCalculation();
  }
}
