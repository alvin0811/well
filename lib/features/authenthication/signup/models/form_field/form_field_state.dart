import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/helper/enum/cubit_message_enums.dart';
import 'package:well_path/helper/helpers.dart';

part 'form_field_state.freezed.dart';

@freezed
class FormFieldState with _$FormFieldState {
  const factory FormFieldState({
    @Default(emptyString) String content,
    @Default(false) bool showErrorIcon,
    CubitMessages? error,
  }) = _FormFieldState;
}
