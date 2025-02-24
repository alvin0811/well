import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:well_path/base_usecase/base_usecase.dart';

import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/extensions/validation_messages.dart';
import 'package:well_path/features/authenthication/signup/models/form_field/form_field_state.dart';
import 'package:well_path/features/settings/editprofile/cubit/edit_profile_navigation.dart';
import 'package:well_path/features/settings/editprofile/edit_profile_usecase/edit_profile_usecase.dart';
import 'package:well_path/features/settings/editprofile/get_user_profile_usecase/get_user_profile_usecase.dart';
import 'package:well_path/features/settings/editprofile/models/edit_profile_state.dart';
import 'package:well_path/features/settings/editprofile/network/request/edit_profile_request.dart';
import 'package:well_path/features/settings/editprofile/network/user/user.dart';
import 'package:well_path/features/settings/media_upload/media_uplaod_usecase/media_uplaod_usecase.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/enum/cubit_message_enums.dart';
import 'package:well_path/helper/helpers.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(
    this._editProfileUseCase,
    this._authStore,
    this._mediaUploadUseCase,
    this._getUserProfileUseCase,
  ) : super(const EditProfileState());

  final EditProfileUseCase _editProfileUseCase;

  final GetUserProfileUseCase _getUserProfileUseCase;

  final MediaUploadUseCase _mediaUploadUseCase;

  final AuthStore _authStore;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<EditProfileNavigation>.broadcast();
  S<EditProfileNavigation> get navigation => _navigation.stream;

  final _onEditComplete = StreamController<Nothing>.broadcast();
  Stream<Nothing> get onEditComplete => _onEditComplete.stream;

  EditProfileState _editProfile = const EditProfileState();

  void onNameChanged(String name) {
    emit(
      state.copyWith(
        name: state.name.copyWith(
          content: name.trim(),
          error: name.trim().isEmpty ? CubitMessages.requiredField : null,
          showErrorIcon: true,
        ),
        isProfileEdit: true,
      ),
    );
    _enableNext();
  }

  void onEmailChanged(String email) {
    emit(
      state.copyWith(
        email: state.email.copyWith(
          content: email.trim(),
          error: email.trim().isEmpty ? CubitMessages.requiredField : null,
          showErrorIcon: true,
        ),
        isProfileEdit: true,
      
      ),
    );
    _enableNext();
  }

  void onPhoneChanged(String phone) {
    final error = phone.trim().phoneError;
    emit(
      state.copyWith(
        phone: state.phone.copyWith(
          content: phone.trim(),
          error: phone.trim().isEmpty ? CubitMessages.requiredField : null,
          showErrorIcon: true,
        ),
        enableNext: error == null,
        isProfileEdit: true,
      ),
    );
  }

  Future<void> getUserProfile() async {
    _loader.sink.add(true);

    final response = await _getUserProfileUseCase(nothing);

    if (response.isError) {
      _loader.sink.add(false);
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final userResponse = response.asValue!.value.user;
      _editProfile = state.copyWith(
        email: FormFieldState(content: userResponse!.email),
        name: FormFieldState(content: userResponse.fullName),
        phone: FormFieldState(
          content: userResponse.phoneNumber ?? emptyString,
        ),
        formFieldsDataMapped: true,
      );
      await _authStore.setUser(userResponse.toAuthUser());

      return emit(_editProfile);
    }
  }

  Future<void> getUserFromAuthStore() async {
    final userResponse = await _authStore.getUser();

    if (userResponse != null) {
      _editProfile = state.copyWith(
        email: FormFieldState(content: userResponse.email ?? emptyString),
        name: FormFieldState(content: userResponse.fullName ?? emptyString),
        phone: FormFieldState(
          content: userResponse.phoneNumber ?? emptyString,
        ),
        formFieldsDataMapped: true,
        images: EditProfileImageUIModel.network(
            id: userResponse.id, url: userResponse.thumbPath.toString()),
      );

      return emit(_editProfile);
    }
  }

  Future<void> saveProfile() async {
    _loader.sink.add(true);
    final mediaId = await _authStore.getMediaId();
    _enableNext(isLoading: true);
    final response = await _editProfileUseCase(
      EditProfileRequest(
        email: state.email.content,
        phone: state.phone.content,
        profilePictureId: mediaId ?? 0,
        name: state.name.content,
      ),
    );
    // _enableNext();
    if (response.isError) {
      _loader.sink.add(false);
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(
          CubitMessage.network(message: errorMessage.message, isError: true));
    } else {
      _loader.sink.add(false);
      final userResponse = response.asValue!.value.data;
      if (userResponse) {
        await getUserProfile();
         _navigation.sink.add(EditProfileNavigation.settings);
      }
     
      // _onEditComplete.add(nothing);
    }
  }

  void uploadMedia(File file) async {
    _loader.add(true);
    int? mediaId;

    emit(state.copyWith(
        images: EditProfileImageUIModel.local(filePath: file.path)));

    final uploadResult = await _mediaUploadUseCase(
      MediaUploadUseCaseParams(file),
    );

    if (uploadResult.isError) {
      _loader.sink.add(false);
      final errorMessage = uploadResult as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    }

    if (uploadResult.isValue) {
      _loader.sink.add(false);
      mediaId = uploadResult.asValue!.value!.id;
      emit(state.copyWith(isProfileEdit: true));
      _enableNext();
      await _authStore.setMediaId(mediaId);
    }

    if (mediaId == null) {
      _loader.sink.add(false);
      emit(state.copyWith(isProfileEdit: true));
      _enableNext();
      _message
          .add(CubitMessage.network(message: 'Media could not be uploaded'));
      return;
    }
  }

  void setFormFieldsDataMapped(bool isDataMapped) {
    emit(state.copyWith(formFieldsDataMapped: isDataMapped));
  }

  void _enableNext({bool isLoading = false}) {
    emit(state.copyWith(enableNext: state.isFormValid && !isLoading));
  }

  @override
  Future<void> close() {
    _navigation.close();
    _loader.close();
    _message.close();
    _onEditComplete.close();
    return super.close();
  }
}
