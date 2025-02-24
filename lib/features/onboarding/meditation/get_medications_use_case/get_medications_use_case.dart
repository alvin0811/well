import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/meditation/network/medications_service.dart';
import 'package:well_path/features/onboarding/meditation/network/response/medications_response.dart';

class GetMeditationUseCase extends UseCase<Nothing, MeditationResponse> {
  GetMeditationUseCase(this._meditationService);

  final MeditationService _meditationService;

  @override
  Future<Response<MeditationResponse>> execute(Nothing params) {
    return _meditationService.getMedications();
  }
}
