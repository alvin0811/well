import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/extensions/validation_messages.dart';

import 'package:well_path/features/settings/changepassword/changepasswordotp/change_password_otp_usecase/change_password_otp_usecase.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/cubit/change_password_otp_navigation_enums.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/models/change_password_otp_state.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/network/request/change_password_otp_request.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/network/response/change_password_otp_response.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class ChangePasswordOtpCubit extends Cubit<ChangePasswordOtpState> {
  ChangePasswordOtpCubit(
    this._changePasswordOtpUseCase,
    this._authStore,
    @factoryParam this._token,
  ) : super(const ChangePasswordOtpState());

  final AuthStore _authStore;

  final String _token;

  final ChangePasswordOtpUseCase _changePasswordOtpUseCase;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation =
      SController<OtpSettingResetPasswordNavigation>.broadcast();
  S<OtpSettingResetPasswordNavigation> get navigation => _navigation.stream;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  void setToken() {
    emit(
      state.copyWith(token: _token),
    );
  }

  void otpChanged(String code) {
    final error = code.trim().universalError;
    emit(
      state.copyWith(
        code: state.code.copyWith(
          content: code.trim(),
          error: error,
          showErrorIcon: true,
        ),
        enableNext: error == null,
      ),
    );
  }

  Future<void> submit() async {
    _loader.sink.add(true);

    emit(state.copyWith(enableNext: false));

    final response = await _changePasswordOtpUseCase(
      ChangePasswordOtpRequest(
        token: _token,
        code: state.code.content,
      ),
    );

    _loader.sink.add(false);
    emit(state.copyWith(enableNext: true));

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(
        message: errorMessage.message,
        isError: true,
      ));
      return;
    } else {
      final changePasswordOtpResponse = response.asValue!.value;
      _saveToken(changePasswordOtpResponse);
      _navigation.add(
        OtpSettingResetPasswordNavigation(changePasswordOtpResponse.token),
      );
    }
  }

  void _saveToken(ChangePasswordOtpResponse response) async {
    await _authStore.setToken(
      response.token,
    );
  }

  @override
  Future<void> close() {
    _navigation.close();
    _loader.close();
    _message.close();
    return super.close();
  }
}
