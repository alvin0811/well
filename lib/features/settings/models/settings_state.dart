import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/helper/helpers.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    @Default(emptyString) String userName,
    @Default(emptyString) String userEmail,
    @Default(emptyString) String userImage,
    @Default(false) bool isDeleted,
  }) = _SettingState;

  const SettingState._();
}
