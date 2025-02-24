import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/authenthication/signup/models/form_field/form_field_state.dart';
import 'package:well_path/helper/helpers.dart';

part 'setting_reset_password_state.freezed.dart';

@freezed
class SettingResetPasswordState with _$SettingResetPasswordState {
  const factory SettingResetPasswordState({
    @Default(FormFieldState()) FormFieldState password,
    @Default(FormFieldState()) FormFieldState confirmPassword,
    @Default(emptyString) String token,
    @Default(false) bool enableNext,
  }) = _SettingResetPasswordState;

  const SettingResetPasswordState._();

  bool get isFormValid {
    return password.content == confirmPassword.content;
  }
}
