import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/authenthication/signup/models/form_field/form_field_state.dart';
import 'package:well_path/helper/helpers.dart';

part 'otp_verification_state.freezed.dart';

@freezed
class OtpVerificationState with _$OtpVerificationState {
  const factory OtpVerificationState({
    @Default(FormFieldState()) FormFieldState code,
    @Default(false) bool enableNext,
    @Default(emptyString) String email,
  }) = _OtpVerificationState;
}
