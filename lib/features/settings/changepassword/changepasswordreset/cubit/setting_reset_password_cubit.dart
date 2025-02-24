import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/extensions/validation_messages.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/cubit/setting_reset_password_navigation.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/models/setting_reset_password_state.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/network/request/setting_reset_password_request.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/setting_reset_password/setting_reset_password_usecase.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class SettingResetPasswordCubit extends Cubit<SettingResetPasswordState> {
  SettingResetPasswordCubit(
    this._settingResetPasswordUseCase,
    this._authStore,
    @factoryParam this._token,
  ) : super(const SettingResetPasswordState());

  final SettingResetPasswordUseCase _settingResetPasswordUseCase;

  final AuthStore _authStore;

  final String _token;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<SettingResetPasswordNavigation>.broadcast();
  S<SettingResetPasswordNavigation> get navigation => _navigation.stream;

  void setToken() {
    emit(
      state.copyWith(token: _token),
    );
  }

  void onPasswordChanged(String password) {
    emit(
      state.copyWith(
        confirmPassword: state.confirmPassword.copyWith(
          error: state.confirmPassword.content.toConfirmPasswordError(
            password,
          ),
          showErrorIcon: true,
        ),
        password: state.password.copyWith(
          content: password.trim(),
          error: password.trim().passwordError,
          showErrorIcon: true,
        ),
      ),
    );
    _enableNext();
  }

  void onConfirmPasswordChanged(String password) {
    emit(
      state.copyWith(
        confirmPassword: state.confirmPassword.copyWith(
          content: password.trim(),
          error: password.toConfirmPasswordError(state.password.content),
          showErrorIcon: true,
        ),
        password: state.password.copyWith(
          error: state.password.content.passwordError,
          showErrorIcon: true,
        ),
      ),
    );
    _enableNext();
  }

  Future<void> submit() async {
    // final token = await _authStore.getToken();
    _loader.sink.add(true);
    _enableNext(isLoading: true);

    final response = await _settingResetPasswordUseCase(
      SettingResetPasswordRequest(
        password: state.password.content,
        token: _token,
      ),
    );

    _loader.sink.add(false);
    _enableNext();

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      _navigation.sink.add(SettingResetPasswordNavigation.successDialog);
    }
  }

  void _enableNext({bool isLoading = false}) {
    emit(state.copyWith(enableNext: state.isFormValid && !isLoading));
  }

  @override
  Future<void> close() {
    _navigation.close();
    _loader.close();
    _message.close();
    return super.close();
  }
}
