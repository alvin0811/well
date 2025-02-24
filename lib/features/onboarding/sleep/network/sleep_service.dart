import 'package:chopper/chopper.dart';
import 'package:well_path/features/onboarding/sleep/network/request/sleep_request.dart';
import 'package:well_path/features/onboarding/sleep/network/response/sleep_response.dart';

import 'package:well_path/helper/helpers.dart';

part 'sleep_service.chopper.dart';

abstract class SleepService {
  Future<Response<SleepResponse>> sleep(@Body() SleepRequest request);
  Future<Response<SleepResponse>> getsleeps();
}

@ChopperApi()
abstract class DefaultSleepService extends CS implements SleepService {
  static DefaultSleepService create() => _$DefaultSleepService();

  @Put(path: 'v1/sleep')
  @override
  Future<Response<SleepResponse>> sleep(@Body() SleepRequest request);

  @Get(path: 'v1/sleep')
  @override
  Future<Response<SleepResponse>> getsleeps();
}
