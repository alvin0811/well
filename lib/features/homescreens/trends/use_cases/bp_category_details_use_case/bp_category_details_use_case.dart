import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/homescreens/trends/network/request/bp_category_details_request.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_category_details_response.dart';
import 'package:well_path/features/homescreens/trends/network/trends_service.dart';

class BPCategoryDetailsUseCase extends UseCase<
    BloodPressureCategoryDetailRequest, BPCategoryDetailsResponse> {
  BPCategoryDetailsUseCase(this._trendsService);

  final BPTrendsService _trendsService;

  @override
  Future<Response<BPCategoryDetailsResponse>> execute(
      BloodPressureCategoryDetailRequest params) {
    params.timeZoneOffset = DateTime.now().formatedOffset();
    return _trendsService.bpCategoryDetails(params);
  }
}
