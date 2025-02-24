import 'package:bloc/bloc.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/extensions/validation_messages.dart';

import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/change_password_usecase/change_password_usecase.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/cubit/change_password_navigation_enums.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/models/change_password_state.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(
    this._changePasswordUseCase,
    this._authStore,
  ) : super(const ChangePasswordState());

  final AuthStore _authStore;

  final ChangePasswordUseCase _changePasswordUseCase;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<ChangePasswordNavigation>.broadcast();
  S<ChangePasswordNavigation> get navigation => _navigation.stream;

  final _updateText = SController<String?>.broadcast();
  S<String?> get updateText => _updateText.stream;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

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

  Future<void> getUserFromAuthStore() async {
    final userResponse = await _authStore.getUser();

    if (userResponse != null) {
      _updateText.sink.add(userResponse.email!);
      return emit(state.copyWith(enableNext: true));
    }
  }

  Future<void> submit() async {
    _loader.sink.add(true);

    emit(state.copyWith(enableNext: false));

    final response = await _changePasswordUseCase(nothing);

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
      final changePasswordResponse = response.asValue!.value;
      _navigation.add(
        OtpChangePasswordNavigation(changePasswordResponse.token),
      );
    }
  }

  void _enableNext({bool isLoading = false}) {
    emit(state.copyWith(enableNext: state.isFormValid && !isLoading));
  }

  @override
  Future<void> close() {
    _updateText.close();
    _navigation.close();
    _loader.close();
    _message.close();
    return super.close();
  }
}
