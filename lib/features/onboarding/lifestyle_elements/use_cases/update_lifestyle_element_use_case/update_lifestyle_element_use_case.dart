import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/lifestyle_element_service.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/request/lifestyle_elements_api_requests/update_lifestyle_elements_request.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/lifestyle_elements_api_responses/lifestyle_elements_response.dart';

class UpdateLifestyleElementsUseCase
    extends UseCase<UpdateLifestyleElementsRequest, LifestyleElementsResponse> {
  UpdateLifestyleElementsUseCase(this._lifestyleElementService);

  final LifestyleElementService _lifestyleElementService;

  @override
  Future<Response<LifestyleElementsResponse>> execute(
      UpdateLifestyleElementsRequest params) {
    return _lifestyleElementService.updateLifestyleElement(params);
  }
}
