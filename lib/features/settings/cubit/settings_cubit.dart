import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:well_path/base_usecase/base_usecase.dart';

import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/features/settings/delete_user_use_case/delete_user_use_case.dart';
import 'package:well_path/features/settings/editprofile/cubit/edit_profile_navigation.dart';
import 'package:well_path/features/settings/models/settings_state.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(
    this._authStore,
    this._deleteUserUseCase,
  ) : super(const SettingState());

  final AuthStore _authStore;
  final DeleteUserUseCase _deleteUserUseCase;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<EditProfileNavigation>.broadcast();
  S<EditProfileNavigation> get navigation => _navigation.stream;

  final _deleteAccountNavigation = SController<Nothing>.broadcast();
  S<Nothing> get deleteAccountNavigation => _deleteAccountNavigation.stream;

  SettingState _settingState = const SettingState();

  Future<void> getUserFromAuthStore() async {
    final userResponse = await _authStore.getUser();

    if (userResponse != null) {
      _settingState = state.copyWith(
        userEmail: userResponse.email ?? emptyString,
        userName: userResponse.fullName ?? emptyString,
        userImage: userResponse.path ?? emptyString,
      );
      return emit(_settingState);
    }
  }

  Future<void> deleteUser() async {
    _loader.sink.add(true);

    final response = await _deleteUserUseCase(nothing);

    _loader.sink.add(false);
    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final deleteUserResponse = response.asValue!.value;
      _settingState = state.copyWith(isDeleted: deleteUserResponse.data);
      _deleteAccountNavigation.sink.add(nothing);
      return emit(_settingState);
    }
  }

  @override
  Future<void> close() {
    _navigation.close();
    _loader.close();
    _message.close();
    return super.close();
  }
}
