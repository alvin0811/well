import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/colors/colors.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/extensions/validation_messages.dart';
import 'package:well_path/features/authenthication/login/cubit/login_navigation_enums.dart';
import 'package:well_path/features/authenthication/login/login_use_case/login_use_case.dart';
import 'package:well_path/features/authenthication/login/models/login_state.dart';
import 'package:well_path/features/authenthication/login/network/request/login_request.dart';
import 'package:well_path/features/authenthication/login/network/response/login_response.dart';
import 'package:well_path/features/settings/editprofile/get_user_profile_usecase/get_user_profile_usecase.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/features/settings/editprofile/network/user/user.dart';
import 'package:well_path/helper/helpers.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._loginUseCase,
    this._authStore,
    this._getUserProfileUseCase,
  ) : super(const LoginState());

  final LoginUseCase _loginUseCase;

  final AuthStore _authStore;

  final GetUserProfileUseCase _getUserProfileUseCase;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<LoginNavigation>.broadcast();
  S<LoginNavigation> get navigation => _navigation.stream;

  final LoginState _loginState = const LoginState();

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

  void onRememberMe(bool? rememberMe) {
    _setRememberMe(rememberMe);
    emit(state.copyWith(rememberMe: rememberMe ?? false));
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
      userGlobalId = response.asValue!.value.user!.id.toString();
      await _authStore.setUser(userResponse!.toAuthUser());
      _navigation.sink.add(LoginNavigation.home);
      return;
    }
  }

  Future<void> login() async {
    _loader.sink.add(true);
    _enableNext(isLoading: true);

    final fcmToken = await FirebaseMessaging.instance.getToken();
    final response = await _loginUseCase(
      LoginRequest(
        email: state.email.content,
        password: state.password.content,
        fcmToken: fcmToken ?? "",
      ),
    );

    _loader.sink.add(false);
    _enableNext();

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final loginResponse = response.asValue!.value;
      _createUserSessionWithLoginResponse(loginResponse);
      return;
    }
  }

  void _createUserSessionWithLoginResponse(LoginResponse response) async {
    await _authStore.setToken(
      response.token,
    );
    await _authStore.setDeviceUUID(
      response.deviceUUID,
    );
    await getUserProfile();
  }

  void _setRememberMe(bool? value) async {
    await _authStore.setRememberMe(
      value ?? false,
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
