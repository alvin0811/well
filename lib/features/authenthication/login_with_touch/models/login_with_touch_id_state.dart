import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/authenthication/signup/models/form_field/form_field_state.dart';
part 'login_with_touch_id_state.freezed.dart';

@freezed
class LoginWithTouchIdState with _$LoginWithTouchIdState {
  const factory LoginWithTouchIdState({
    @Default(FormFieldState()) FormFieldState email,
    @Default(FormFieldState()) FormFieldState password,
    @Default(false) bool enableNext,
    @Default(false) bool isBioMetricEnabled,
    @Default(false) bool termsAndConditions,
    @Default(false) bool touchIdPermission,
  }) = _LoginWithTouchIdState;

  const LoginWithTouchIdState._();

  bool get isFormValid {
    return email.content.isEmailValid &&
        password.content.isPasswordValid &&
        termsAndConditions == true &&
        touchIdPermission == true;
  }
}
