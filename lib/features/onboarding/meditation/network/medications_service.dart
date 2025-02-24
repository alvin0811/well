import 'package:chopper/chopper.dart';
import 'package:well_path/features/onboarding/meditation/network/request/medications_request.dart';
import 'package:well_path/features/onboarding/meditation/network/response/medications_response.dart';

import 'package:well_path/helper/helpers.dart';

part 'medications_service.chopper.dart';

abstract class MeditationService {
  Future<Response<MeditationResponse>> medications(
      @Body() MeditationRequest request);
  Future<Response<MeditationResponse>> getMedications();
  Future<Response<MedicationListResponse>> getMedicationsList();
}

@ChopperApi()
abstract class DefaultMeditationService extends CS
    implements MeditationService {
  static DefaultMeditationService create() => _$DefaultMeditationService();

  @Put(path: 'v1/medications')
  @override
  Future<Response<MeditationResponse>> medications(
      @Body() MeditationRequest request);

  @Get(path: 'v1/medications')
  @override
  Future<Response<MeditationResponse>> getMedications();

  @Get(path: 'v1/medications/list')
  @override
  Future<Response<MedicationListResponse>> getMedicationsList();
}
