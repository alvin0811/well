import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/lifestyle_element_service.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/lifestyle_elements_api_responses/lifestyle_elements_response.dart';

class GetLifestyleElementListUseCase
    extends UseCase<Nothing, LifestyleElementsResponse> {
  GetLifestyleElementListUseCase(this._lifestyleElementService);

  final LifestyleElementService _lifestyleElementService;

  @override
  Future<Response<LifestyleElementsResponse>> execute(Nothing params) {
    return _lifestyleElementService.getLifestyleElementsList();
  }
}
