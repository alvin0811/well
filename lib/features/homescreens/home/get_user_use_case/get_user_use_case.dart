import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/homescreens/home/network/home_service.dart';
import 'package:well_path/features/homescreens/home/network/response/home_response.dart';

class GetUserUseCase extends UseCase<Nothing, HomeResponse> {
  GetUserUseCase(this._homeService);

  final HomeService _homeService;

  @override
  Future<Response<HomeResponse>> execute(Nothing params) {
    return _homeService.getUserDetails();
  }
}
