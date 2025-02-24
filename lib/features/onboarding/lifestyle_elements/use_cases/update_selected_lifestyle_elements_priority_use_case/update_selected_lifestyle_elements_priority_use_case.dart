import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/lifestyle_element_service.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/request/selected_lifestyle_elements_api_requests/change_lifestyle_elements_priority_request.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/selected_lifestyle_elements_api_responses/get_selected_lifestyle_elements_response.dart';

class UpdateSelectedLifestyleElementsPriorityUseCase extends UseCase<
    ChangeLifestyleElementsPriorityRequest,
    ChangeLifestyleElementPriorityResponse> {
  UpdateSelectedLifestyleElementsPriorityUseCase(this._lifestyleElementService);

  final LifestyleElementService _lifestyleElementService;

  @override
  Future<Response<ChangeLifestyleElementPriorityResponse>> execute(
      ChangeLifestyleElementsPriorityRequest params) {
    return _lifestyleElementService.changeLifestyleElementsPriority(params);
  }
}
