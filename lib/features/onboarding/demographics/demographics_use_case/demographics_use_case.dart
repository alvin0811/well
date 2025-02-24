import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';

import 'package:well_path/features/onboarding/demographics/network/demographics_service.dart';
import 'package:well_path/features/onboarding/demographics/network/request/demographics_request.dart';
import 'package:well_path/features/onboarding/demographics/network/response/demographics_response.dart';

class DemographicUseCase
    extends UseCase<DemographicRequest, DemographicResponse> {
  DemographicUseCase(this._demographicService);

  final DemographicService _demographicService;

  @override
  Future<Response<DemographicResponse>> execute(DemographicRequest params) {
    return _demographicService.demographic(params);
  }
}
