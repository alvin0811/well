import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';

import 'package:well_path/features/onboarding/demographics/network/demographics_service.dart';

import 'package:well_path/features/onboarding/demographics/network/response/demographics_response.dart';

class GetDemographicUseCase extends UseCase<Nothing, DemographicResponse> {
  GetDemographicUseCase(this._demographicService);

  final DemographicService _demographicService;

  @override
  Future<Response<DemographicResponse>> execute(Nothing params) {
    return _demographicService.getDemoGraphic();
  }
}
