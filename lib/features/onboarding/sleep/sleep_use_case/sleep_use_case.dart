import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/sleep/network/request/sleep_request.dart';
import 'package:well_path/features/onboarding/sleep/network/response/sleep_response.dart';
import 'package:well_path/features/onboarding/sleep/network/sleep_service.dart';

class SleepUseCase extends UseCase<SleepRequest, SleepResponse> {
  SleepUseCase(this._sleepService);

  final SleepService _sleepService;

  @override
  Future<Response<SleepResponse>> execute(SleepRequest params) {
    return _sleepService.sleep(params);
  }
}
