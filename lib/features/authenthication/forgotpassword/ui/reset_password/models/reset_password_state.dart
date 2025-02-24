import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/authenthication/signup/models/form_field/form_field_state.dart';

part 'reset_password_state.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    @Default(FormFieldState()) FormFieldState password,
    @Default(FormFieldState()) FormFieldState confirmPassword,
    @Default(false) bool enableNext,
  }) = _ResetPasswordState;

  const ResetPasswordState._();

  bool get isFormValid {
    return password.content == confirmPassword.content;
  }
}
