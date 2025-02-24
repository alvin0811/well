import 'package:chopper/chopper.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/request/lifestyle_elements_api_requests/update_lifestyle_elements_request.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/request/selected_lifestyle_elements_api_requests/change_lifestyle_elements_priority_request.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/lifestyle_elements_api_responses/get_lifestyle_element_list_response.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/lifestyle_elements_api_responses/lifestyle_elements_response.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/selected_lifestyle_elements_api_responses/get_selected_lifestyle_elements_response.dart';
import 'package:well_path/helper/helpers.dart';

part 'lifestyle_element_service.chopper.dart';

abstract class LifestyleElementService {
  Future<Response<LifestyleElementsResponse>> updateLifestyleElement(
      @Body() UpdateLifestyleElementsRequest request);

  Future<Response<GetLifestyleElementListResponse>> getLifestyleElements();

  Future<Response<LifestyleElementsResponse>> getLifestyleElementsList();

// * Selected Lifestyle Elements
  Future<Response<GetSelectedLifestyleElementsResponse>>
      getSelectedLifestyleElements();

  Future<Response<ChangeLifestyleElementPriorityResponse>>
      changeLifestyleElementsPriority(
          @Body() ChangeLifestyleElementsPriorityRequest request);
}

@ChopperApi()
abstract class DefaultLifestyleElementService extends CS
    implements LifestyleElementService {
  static DefaultLifestyleElementService create() =>
      _$DefaultLifestyleElementService();

  @Put(path: 'v1/lifestyle')
  @override
  Future<Response<LifestyleElementsResponse>> updateLifestyleElement(
      @Body() UpdateLifestyleElementsRequest request);

  @Get(path: 'v1/lifestyle/list')
  @override
  Future<Response<GetLifestyleElementListResponse>> getLifestyleElements();

  @Get(path: 'v1/lifestyle')
  @override
  Future<Response<LifestyleElementsResponse>> getLifestyleElementsList();

// * Selected Lifestyle Elements
  @Get(path: 'v1/lifestyle/selected')
  @override
  Future<Response<GetSelectedLifestyleElementsResponse>>
      getSelectedLifestyleElements();

  @Put(path: 'v1/lifestyle/change-priority')
  @override
  Future<Response<ChangeLifestyleElementPriorityResponse>>
      changeLifestyleElementsPriority(
          @Body() ChangeLifestyleElementsPriorityRequest request);
}
