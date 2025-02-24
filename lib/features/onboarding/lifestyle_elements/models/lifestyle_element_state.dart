import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/lifestyle_elements_api_responses/get_lifestyle_element_list_response.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/selected_lifestyle_elements_api_responses/get_selected_lifestyle_elements_response.dart';

part 'lifestyle_element_state.freezed.dart';

@freezed
class LifestyleElementState with _$LifestyleElementState {
  const factory LifestyleElementState({
    @Default([]) List<int> lifestyleIds,
    @Default([]) List<LifestyleListItem> lifestyleItem,
    @Default([]) List<SelectedLifestyleItem> selectedLifestyleItem,
    @Default(false) bool isChangeLifestyleElementsPriority,
    @Default(false) bool enableNext,
  }) = _LifestyleElementState;

  const LifestyleElementState._();
}
