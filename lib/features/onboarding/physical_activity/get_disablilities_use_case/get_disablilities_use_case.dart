import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/physical_activity/network/physical_activity_service.dart';
import 'package:well_path/features/onboarding/physical_activity/network/response/physical_activity_response.dart';

class GetDisabilitiesUseCase
    extends UseCase<Nothing, GetDisabilitiesListResponse> {
  GetDisabilitiesUseCase(this._physicalActivityService);

  final PhysicalActivityService _physicalActivityService;

  @override
  Future<Response<GetDisabilitiesListResponse>> execute(Nothing params) {
    return _physicalActivityService.getDisabilitiesList();
  }
}
