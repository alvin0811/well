import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/lifestyle_element_service.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/selected_lifestyle_elements_api_responses/get_selected_lifestyle_elements_response.dart';

class GetSelectedLifestyleElementsUseCase
    extends UseCase<Nothing, GetSelectedLifestyleElementsResponse> {
  GetSelectedLifestyleElementsUseCase(this._lifestyleElementService);

  final LifestyleElementService _lifestyleElementService;

  @override
  Future<Response<GetSelectedLifestyleElementsResponse>> execute(Nothing params) {
    return _lifestyleElementService.getSelectedLifestyleElements();
  }
}