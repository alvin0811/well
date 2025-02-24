import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/authenthication/signup/models/form_field/form_field_state.dart';
import 'package:well_path/helper/helpers.dart';

part 'change_password_otp_state.freezed.dart';

@freezed
class ChangePasswordOtpState with _$ChangePasswordOtpState {
  const factory ChangePasswordOtpState({
    @Default(FormFieldState()) FormFieldState code,
    @Default(false) bool enableNext,
    @Default(emptyString) String token,
  }) = _ChangePasswordOtpState;
}
