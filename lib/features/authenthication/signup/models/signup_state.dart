import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/authenthication/signup/models/form_field/form_field_state.dart';
part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    @Default(FormFieldState()) FormFieldState name,
    @Default(FormFieldState()) FormFieldState email,
    @Default(FormFieldState()) FormFieldState phone,
    @Default(FormFieldState()) FormFieldState password,
    @Default(FormFieldState()) FormFieldState confirmPassword,
    @Default(false) bool enableNext,
  }) = _SignupState;

  const SignupState._();

  bool get isFormValid {
    return name.content.isNotEmpty &&
        email.content.isEmailValid &&
        phone.content.isPhoneNumberLengthIsValid &&
        confirmPassword.content.isPasswordValid &&
        password.content.isPasswordValid &&
        confirmPassword.content.isConfirmPasswordValid(password.content);
  }
}
