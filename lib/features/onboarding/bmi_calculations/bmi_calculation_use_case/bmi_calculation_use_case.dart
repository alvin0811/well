import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/bmi_calculations/network/bmi_calculation_service.dart';
import 'package:well_path/features/onboarding/bmi_calculations/network/request/bmi_calculation_request.dart';
import 'package:well_path/features/onboarding/bmi_calculations/network/response/bmi_calculation_response.dart';

class BmiCalculationUseCase
    extends UseCase<BmiCalculationRequest, BmiCalculationResponse> {
  BmiCalculationUseCase(this._bmiCalculationService);

  final BmiCalculationService _bmiCalculationService;

  @override
  Future<Response<BmiCalculationResponse>> execute(
      BmiCalculationRequest params) {
    return _bmiCalculationService.bmiCalculation(params);
  }
}
