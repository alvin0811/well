import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/onboarding/meditation/network/response/medications_response.dart';

part 'medications_state.freezed.dart';

@freezed
class MeditationState with _$MeditationState {
  const factory MeditationState({
    @Default([]) List<int> medicationIds,
    @Default(MedicationListResponse(medicationList: []))
    MedicationListResponse medicationListItems,
    @Default(0) int? medicationLevel,
    @Default(0) int? activityLevel,
    @Default(false) bool enableNext,
    @Default(false) bool formFieldsDataMapped,
  }) = _MeditationState;

  const MeditationState._();

  bool get isFormValid {
    return medicationLevel.toString().isNotEmpty &&
        activityLevel.toString().isNotEmpty;
  }
}
