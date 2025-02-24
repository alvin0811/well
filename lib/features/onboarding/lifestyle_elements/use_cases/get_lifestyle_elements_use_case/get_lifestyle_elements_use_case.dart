import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/lifestyle_element_service.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/lifestyle_elements_api_responses/get_lifestyle_element_list_response.dart';

class GetLifestyleElementsUseCase
    extends UseCase<Nothing, GetLifestyleElementListResponse> {
  GetLifestyleElementsUseCase(this._lifestyleElementService);

  final LifestyleElementService _lifestyleElementService;

  @override
  Future<Response<GetLifestyleElementListResponse>> execute(Nothing params) {
    return _lifestyleElementService.getLifestyleElements();
  }
}
