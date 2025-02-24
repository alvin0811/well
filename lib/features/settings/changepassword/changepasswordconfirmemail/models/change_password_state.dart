import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/authenthication/signup/models/form_field/form_field_state.dart';

part 'change_password_state.freezed.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    @Default(FormFieldState()) FormFieldState email,
    @Default(false) bool enableNext,
    @Default("") String emailcontent,
  }) = _ChangePasswordState;
  const ChangePasswordState._();
  bool get isFormValid {
    return email.content.isEmailValid;
  }
}
