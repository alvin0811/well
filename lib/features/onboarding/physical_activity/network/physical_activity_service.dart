import 'package:chopper/chopper.dart';
import 'package:well_path/features/onboarding/physical_activity/network/request/physical_activity_request.dart';
import 'package:well_path/features/onboarding/physical_activity/network/response/physical_activity_response.dart';

import 'package:well_path/helper/helpers.dart';

part 'physical_activity_service.chopper.dart';

abstract class PhysicalActivityService {
  Future<Response<PhysicalActivityResponse>> physicalActivity(
      @Body() PhysicalActivityRequest request);

  Future<Response<PhysicalActivityResponse>> getPhysicalActivity();

  Future<Response<GetDisabilitiesListResponse>> getDisabilitiesList();
}

@ChopperApi()
abstract class DefaultPhysicalActivityService extends CS
    implements PhysicalActivityService {
  static DefaultPhysicalActivityService create() =>
      _$DefaultPhysicalActivityService();

  @Put(path: 'v1/physical-activity')
  @override
  Future<Response<PhysicalActivityResponse>> physicalActivity(
      @Body() PhysicalActivityRequest request);

  @Get(path: 'v1/physical-activity')
  @override
  Future<Response<PhysicalActivityResponse>> getPhysicalActivity();

  @Get(path: 'v1/disabilities/list')
  @override
  Future<Response<GetDisabilitiesListResponse>> getDisabilitiesList();
}
