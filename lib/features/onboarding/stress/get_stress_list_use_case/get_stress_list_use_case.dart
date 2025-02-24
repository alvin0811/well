import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:chopper/chopper.dart';
import 'package:well_path/features/onboarding/stress/network/response/stress_list_response.dart';
import 'package:well_path/features/onboarding/stress/network/stress_service.dart';

class GetStressListUseCase extends UseCase<Nothing, StressListResponse> {
  GetStressListUseCase(this._stressService);

  final StressService _stressService;

  @override
  Future<Response<StressListResponse>> execute(Nothing params) {
    return _stressService.getStressList();
  }
}
