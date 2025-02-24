import 'package:bloc/bloc.dart';

import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/extensions/validation_messages.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/cubit/reset_password_navigation_enums.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/models/reset_password_state.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/network/request/reset_password_request.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/reset_password_use_case/reset_password_use_case.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(
    this._resetPasswordUseCase,
    this._authStore,
  ) : super(const ResetPasswordState());

  final ResetPasswordUseCase _resetPasswordUseCase;

  final AuthStore _authStore;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<ResetPasswordNavigation>.broadcast();
  S<ResetPasswordNavigation> get navigation => _navigation.stream;

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
    final token = await _authStore.getToken();
    _loader.sink.add(true);
    _enableNext(isLoading: true);

    final response = await _resetPasswordUseCase(
      ResetPasswordRequest(
        password: state.password.content,
        token: token.toString(),
      ),
    );

    _loader.sink.add(false);
    _enableNext();

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      _navigation.sink.add(ResetPasswordNavigation.successDialog);
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
