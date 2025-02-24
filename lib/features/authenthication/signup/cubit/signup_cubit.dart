import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/extensions/validation_messages.dart';
import 'package:well_path/features/authenthication/signup/cubit/signup_navigation_enums.dart';
import 'package:well_path/features/authenthication/signup/models/signup_state.dart';
import 'package:well_path/features/authenthication/signup/network/request/sign_up_request.dart';
import 'package:well_path/features/authenthication/signup/network/response/sign_up_response.dart';
import 'package:well_path/features/authenthication/signup/signup_user_use_case/signup_user_use_case.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signupUseCase, this._authStore, {SignupState? initialState})
      : super(initialState ?? const SignupState());

  final SignUpUseCase _signupUseCase;

  final AuthStore _authStore;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<SignupNavigation>.broadcast();
  S<SignupNavigation> get navigation => _navigation.stream;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  void onNameChanged(String name) {
    emit(
      state.copyWith(
        name: state.name.copyWith(
          content: name.trim(),
          error: name.trim().fullNameError,
          showErrorIcon: true,
        ),
      ),
    );
    _enableNext();
  }

  void onEmailChanged(String email) {
    emit(
      state.copyWith(
        email: state.email.copyWith(
          content: email.trim(),
          error: email.trim().emailError,
          showErrorIcon: true,
        ),
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
          error: error,
          showErrorIcon: true,
        ),
        enableNext: error == null,
      ),
    );
    _enableNext();
  }

  void onPasswordChanged(String password) {
    emit(
      state.copyWith(
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

  Future<void> register() async {
    _loader.sink.add(true);
    _enableNext(isLoading: true);

    final fcmToken = await FirebaseMessaging.instance.getToken();
    final response = await _signupUseCase(
      SignUpRequest(
        name: state.name.content,
        email: state.email.content,
        phone: state.phone.content,
        password: state.password.content, 
        fcmToken: fcmToken ?? '',
      ),
    );
    _loader.sink.add(false);
    _enableNext();
    try {
      if (response.isError) {
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(
            CubitMessage.network(message: errorMessage.message, isError: true));
        return;
      } else {
        final signUpResponse = response.asValue!.value;
        _createUserSessionWithSignUpResponse(signUpResponse);
        _navigation.sink.add(SignupNavigation.login);
      }
    } catch (e) {
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  void _createUserSessionWithSignUpResponse(SignUpResponse response) async {
    await _authStore.setSession(
      response.token,
      response.deviceUUID,
      response.user.toAuthStoreModel(),
    );
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
