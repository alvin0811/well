import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/authenthication/signup/models/form_field/form_field_state.dart';
part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState(
      {@Default(FormFieldState()) FormFieldState name,
      @Default(FormFieldState()) FormFieldState email,
      @Default(FormFieldState()) FormFieldState phone,
      @Default(false) bool isProfileEdit,
      @Default(false) bool enableNext,
      @Default(false) bool formFieldsDataMapped,
      EditProfileImageUIModel? images,
      @Default(false) bool popBackSetting}) = _EditProfileState;

  const EditProfileState._();

  bool get isFormValid {
    return email.content.isEmailValid &&
        phone.content.isNotEmpty &&
        name.content.isNotEmpty &&
        isProfileEdit == true;
  }
}

@freezed
class EditProfileImageUIModel with _$EditProfileImageUIModel {
  factory EditProfileImageUIModel.network({
    required int id,
    required String url,
  }) = EditProfileImageUIModelNetwork;

  factory EditProfileImageUIModel.local({
    required String filePath,
  }) = EditProfileImageUIModelLocal;
}
