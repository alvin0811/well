import 'package:bloc/bloc.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/extensions/validation_messages.dart';
import 'package:well_path/features/authenthication/login_with_touch/auth_service/auth_service.dart';
import 'package:well_path/features/authenthication/login_with_touch/cubit/login_with_touch_id_navigation_enums.dart';
import 'package:well_path/features/authenthication/login_with_touch/login_with_touch_id_use_case/login_with_touch_id_use_case.dart';
import 'package:well_path/features/authenthication/login_with_touch/models/login_with_touch_id_state.dart';
import 'package:well_path/features/authenthication/login_with_touch/network/request/login_with_touch_id_request.dart';
import 'package:well_path/features/authenthication/login_with_touch/network/response/login_with_touch_id_response.dart';
import 'package:well_path/features/settings/editprofile/get_user_profile_usecase/get_user_profile_usecase.dart';
import 'package:well_path/features/settings/editprofile/network/user/user.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';
import 'package:well_path/helper/logger/logger.dart';

class LoginWithTouchIdCubit extends Cubit<LoginWithTouchIdState> {
  LoginWithTouchIdCubit(
    this._loginWithTouchIdUseCase,
    this._authStore,
    this._getUserProfileUseCase,
  ) : super(const LoginWithTouchIdState());

  final LoginWithTouchIdUseCase _loginWithTouchIdUseCase;

  final AuthStore _authStore;

  final GetUserProfileUseCase _getUserProfileUseCase;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<LoginWithTouchIdNavigation>.broadcast();
  S<LoginWithTouchIdNavigation> get navigation => _navigation.stream;

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

  void onTouchIdPermission(bool? touchIdPermission) {
    emit(state.copyWith(touchIdPermission: touchIdPermission ?? false));
    _enableNext();
  }

  void onTermsAndConditions(bool? termsAndConditions) {
    emit(state.copyWith(termsAndConditions: termsAndConditions ?? false));
    _enableNext();
  }

  Future<void> loginAfterTouchID() async {
    _loader.sink.add(true);
    _enableNext(isLoading: true);
    
      String email = "";
      email = await _authStore.getUserEmail() ?? "";

      String password = "";
      password = await _authStore.getUserPassword() ?? "";
    

    final response = await _loginWithTouchIdUseCase(
      
      LoginWithTouchIdRequest(
        email: email,
        password: password,
      ),
    );

    _loader.sink.add(false);
    _enableNext();

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      // _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final loginResponse = response.asValue!.value;
      _createUserSessionWithLoginResponse(loginResponse);
      return;
    }
  }

  Future<void> login() async {
    _loader.sink.add(true);
    _enableNext(isLoading: true);

    final response = await _loginWithTouchIdUseCase(
      LoginWithTouchIdRequest(
        email: state.email.content,
        password: state.password.content,
      ),
    );

    _loader.sink.add(false);
    _enableNext();

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      Logger.i( errorMessage.message);
      return;
    } else {
        Logger.i( "test else");
      final loginResponse = response.asValue!.value;
      _createUserSessionWithLoginResponse(loginResponse);
      _authStore.setUserDetails(state.email.content, state.password.content);
      return;
    }
  }

  void _createUserSessionWithLoginResponse(
      LoginWithTouchIdResponse response) async {
    await _authStore.setToken(
      response.token,
    );
    await _authStore.setDeviceUUID(
      response.deviceUUID,
    );
    await getUserProfile();
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
      await _authStore.setUser(userResponse!.toAuthUser());
      authenticate();
      return;
    }
  }

  void onBioMetricEnabled(bool? value) {
    _setBioMetricEnabled(value);
    emit(
      state.copyWith(isBioMetricEnabled: value ?? false),
    );
  }

  void _setBioMetricEnabled(bool? value) async {
    await _authStore.setIsBioMetricEnabled(
      value ?? false,
    );
  }

  Future<void> authenticate() async {
    _loader.sink.add(true);
    bool isAuthenticated = await AuthService.authenticateUser();
    if (isAuthenticated) {
      _setBioMetricEnabled(true);
      _loader.sink.add(false);
      _navigation.sink.add(LoginWithTouchIdNavigation.home);
    } else {
      _loader.sink.add(false);
      _message.add(CubitMessage.network(message: 'Authentication failed.'));
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
