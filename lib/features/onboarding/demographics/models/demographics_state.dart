import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/authenthication/signup/models/form_field/form_field_state.dart';
import 'package:well_path/features/onboarding/demographics/network/request/demographics_request.dart';

part 'demographics_state.freezed.dart';

@freezed
class DemographicState with _$DemographicState {
  const factory DemographicState({
    @Default(GenderStatus.male) GenderStatus genderStatus,
    @Default(FormFieldState()) FormFieldState dateOfBirth,
    @Default(EthnicityStatus.white) EthnicityStatus ethnicities,
    @Default(false) bool enableNext,
    @Default(false) bool formFieldsDataMapped,
  }) = _DemographicState;

  const DemographicState._();

  bool get isFormValid {
    return dateOfBirth.content.isNotEmpty &&
        genderStatus.toString().isNotEmpty &&
        ethnicities.toString().isNotEmpty;
  }
}
