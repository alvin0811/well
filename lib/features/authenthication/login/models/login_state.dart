import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/authenthication/signup/models/form_field/form_field_state.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(FormFieldState()) FormFieldState email,
    @Default(FormFieldState()) FormFieldState password,
    @Default(false) bool enableNext,
    @Default(false) bool rememberMe,
  }) = _LoginState;

  const LoginState._();

  bool get isFormValid {
    return email.content.isEmailValid && password.content.isPasswordValid;
  }
}
