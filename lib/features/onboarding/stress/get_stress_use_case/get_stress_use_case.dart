import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:chopper/chopper.dart';
import 'package:well_path/features/onboarding/stress/network/response/stress_response.dart';
import 'package:well_path/features/onboarding/stress/network/stress_service.dart';

class GetStressUseCase extends UseCase<Nothing, StressResponse> {
  GetStressUseCase(this._stressService);

  final StressService _stressService;

  @override
  Future<Response<StressResponse>> execute(Nothing params) {
    return _stressService.getStress();
  }
}
