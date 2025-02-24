import 'package:bloc/bloc.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/extensions/validation_messages.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/cubit/forgot_password_navigation_enums.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/forgot_password_usecase/forgot_password_use_case.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/models/forgot_password_state.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/network/request/forgot_password_request.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/network/response/forgot_password_response.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(
    this._forgotPasswordUseCase,
    this._authStore,
  ) : super(const ForgotPasswordState());

  final AuthStore _authStore;

  final ForgotPasswordUseCase _forgotPasswordUseCase;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<ForgotPasswordNavigation>.broadcast();
  S<ForgotPasswordNavigation> get navigation => _navigation.stream;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  void onEmailChanged(String email) {
    final error = email.trim().emailError;
    emit(
      state.copyWith(
        email: state.email.copyWith(
          content: email.trim(),
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

    final response = await _forgotPasswordUseCase(
      ForgotPasswordRequest(email: state.email.content),
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
      final forgotPasswordResponse = response.asValue!.value;
      _saveToken(forgotPasswordResponse);
      _navigation.add(
        OtpForgotPasswordNavigation(state.email.content.toString()),
      );
    }
  }

  void _saveToken(ForgotPasswordResponse response) async {
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
