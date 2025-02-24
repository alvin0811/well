import 'package:chopper/chopper.dart';
import 'package:well_path/features/onboarding/stress/network/request/stress_request.dart';
import 'package:well_path/features/onboarding/stress/network/response/stress_list_response.dart';
import 'package:well_path/features/onboarding/stress/network/response/stress_response.dart';
import 'package:well_path/helper/helpers.dart';

part 'stress_service.chopper.dart';

abstract class StressService {
  Future<Response<StressResponse>> stress(@Body() StressRequest stressRequest);
  Future<Response<StressListResponse>> getStressList();
  Future<Response<StressResponse>> getStress();
}

@ChopperApi()
abstract class DefaultStressService extends CS implements StressService {
  static DefaultStressService create() => _$DefaultStressService();

  @Get(path: 'v1/stress/list')
  @override
  Future<Response<StressListResponse>> getStressList();

  @Get(path: 'v1/stress')
  @override
  Future<Response<StressResponse>> getStress();

  @Put(path: 'v1/stress')
  @override
  Future<Response<StressResponse>> stress(@Body() StressRequest stressRequest);
}
