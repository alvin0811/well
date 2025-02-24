import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/sleep/network/response/sleep_response.dart';
import 'package:well_path/features/onboarding/sleep/network/sleep_service.dart';

class GetSleepUseCase extends UseCase<Nothing, SleepResponse> {
  GetSleepUseCase(this._sleepService);

  final SleepService _sleepService;

  @override
  Future<Response<SleepResponse>> execute(Nothing params) {
    return _sleepService.getsleeps();
  }
}
