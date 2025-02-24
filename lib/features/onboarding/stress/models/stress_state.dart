import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/onboarding/stress/network/response/stress_list_response.dart';
import 'package:well_path/features/onboarding/stress/ui/stress_page.dart';

part 'stress_state.freezed.dart';

@freezed
class StressState with _$StressState {
  const factory StressState({
    @Default([]) List<CopingMechanism> copingMechanismList,
    @Default([StressItems(id: 0, title: "")]) List<StressItems>? stressItems,
    @Default([]) List<int> majorStressList,
    @Default([]) List<int> copingMechanism,
  }) = _StressState;

  const StressState._();
}
