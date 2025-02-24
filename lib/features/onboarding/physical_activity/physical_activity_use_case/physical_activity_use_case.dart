import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/physical_activity/network/physical_activity_service.dart';
import 'package:well_path/features/onboarding/physical_activity/network/request/physical_activity_request.dart';
import 'package:well_path/features/onboarding/physical_activity/network/response/physical_activity_response.dart';

class PhysicalActivityUseCase
    extends UseCase<PhysicalActivityRequest, PhysicalActivityResponse> {
  PhysicalActivityUseCase(this._physicalActivityService);

  final PhysicalActivityService _physicalActivityService;

  @override
  Future<Response<PhysicalActivityResponse>> execute(
      PhysicalActivityRequest params) {
    return _physicalActivityService.physicalActivity(params);
  }
}
