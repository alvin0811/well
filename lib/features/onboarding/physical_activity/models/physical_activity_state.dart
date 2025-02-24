import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/onboarding/physical_activity/network/response/physical_activity_response.dart';

part 'physical_activity_state.freezed.dart';

@freezed
class PhysicalActivityState with _$PhysicalActivityState {
  const factory PhysicalActivityState({
    @Default(0) int activeTime,
    @Default(null) bool? haveDisability,
    @Default([]) List<int> disabilityIds,
    @Default(PhysicalActivityResponse(
        activeTime: -1, haveDisability: false, disabilityIds: []))
    PhysicalActivityResponse physicalActivityResponse,
    @Default([]) List<DisabilityItem> disabilityItems,
    @Default(false) bool enableNext,
  }) = _PhysicalActivityState;

  const PhysicalActivityState._();
}
