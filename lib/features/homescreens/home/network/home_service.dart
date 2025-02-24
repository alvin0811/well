import 'dart:developer';

import 'package:chopper/chopper.dart';
import 'package:well_path/features/homescreens/home/network/response/home_response.dart';
import 'package:well_path/helper/helpers.dart';

part 'home_service.chopper.dart';

abstract class HomeService {
  Future<Response<HomeResponse>> getUserDetails();
}

@ChopperApi()
abstract class DefaultHomeService extends CS implements HomeService {
  static DefaultHomeService create() => _$DefaultHomeService();

  @Get(path: 'v1/user/me')
  @override
  Future<Response<HomeResponse>> getUserDetails();
}
