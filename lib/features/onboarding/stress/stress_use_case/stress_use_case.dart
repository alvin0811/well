import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/stress/network/request/stress_request.dart';
import 'package:well_path/features/onboarding/stress/network/stress_service.dart';

import '../network/response/stress_response.dart';

class StressUseCase extends UseCase<StressRequest, StressResponse> {
  StressUseCase(this._stressService);

  final StressService _stressService;

  @override
  Future<Response<StressResponse>> execute(StressRequest params) {
    return _stressService.stress(params);
  }
}
