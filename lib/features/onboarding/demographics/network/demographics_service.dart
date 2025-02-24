import 'package:chopper/chopper.dart';
import 'package:well_path/features/onboarding/demographics/network/request/demographics_request.dart';
import 'package:well_path/features/onboarding/demographics/network/response/demographics_response.dart';

import 'package:well_path/helper/helpers.dart';

part 'demographics_service.chopper.dart';

abstract class DemographicService {
  Future<Response<DemographicResponse>> demographic(
      @Body() DemographicRequest request);

  Future<Response<DemographicResponse>> getDemoGraphic();
}

@ChopperApi()
abstract class DefaultDemographicService extends CS
    implements DemographicService {
  static DefaultDemographicService create() => _$DefaultDemographicService();

  @Put(path: 'v1/demographics')
  @override
  Future<Response<DemographicResponse>> demographic(
      @Body() DemographicRequest request);

  @Get(path: 'v1/demographics')
  @override
  Future<Response<DemographicResponse>> getDemoGraphic();
}
