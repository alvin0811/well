import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/meditation/network/medications_service.dart';
import 'package:well_path/features/onboarding/meditation/network/request/medications_request.dart';
import 'package:well_path/features/onboarding/meditation/network/response/medications_response.dart';

class MeditationUseCase extends UseCase<MeditationRequest, MeditationResponse> {
  MeditationUseCase(this._meditationService);

  final MeditationService _meditationService;

  @override
  Future<Response<MeditationResponse>> execute(MeditationRequest params) {
    return _meditationService.medications(params);
  }
}
