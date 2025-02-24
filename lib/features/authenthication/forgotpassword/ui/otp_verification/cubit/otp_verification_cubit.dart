import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/extensions/validation_messages.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/network/request/forgot_password_request.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/network/response/forgot_password_response.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/cubit/otp_verification_navigation_enums.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/models/otp_verification_state.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/network/request/otp_verification_request.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/network/response/otp_verification_response.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/otp_verification_use_case/otp_verification_use_case.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  OtpVerificationCubit(this._otpVerificationUseCase, this._authStore,
      @factoryParam this._email, this._otpResendUseCase)
      : super(const OtpVerificationState());

  final OtpVerificationUseCase _otpVerificationUseCase;

  final OtpResendUseCase _otpResendUseCase;

  final AuthStore _authStore;

  final String _email;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<OtpVerificationNavigation>.broadcast();
  S<OtpVerificationNavigation> get navigation => _navigation.stream;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _resendMessage = SController<String?>.broadcast();
  S<String?> get resendMessage => _resendMessage.stream;

  void setEmail() {
    emit(
      state.copyWith(email: _email),
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

  Future<void> verifyOtp() async {
    final token = await _authStore.getToken();

    _loader.sink.add(true);
    emit(state.copyWith(enableNext: false));

    final response = await _otpVerificationUseCase(
      OtpVerificationRequest(
        code: state.code.content,
        token: token.toString(),
      ),
    );

    _loader.sink.add(false);
    emit(state.copyWith(enableNext: true));

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(
        CubitMessage.network(
          message: errorMessage.message,
          isError: true,
        ),
      );
      return;
    } else {
      final otpVerificationResponse = response.asValue!.value;
      _saveToken(otpVerificationResponse);
      _navigation.sink.add(VerificationNavigation(_email));
    }
  }

  void _saveToken(OtpVerificationResponse response) async {
    await _authStore.setToken(
      response.token,
    );
  }

  Future<void> resend(String email) async {
    _loader.sink.add(true);
    emit(state.copyWith(enableNext: false));

    final response = await _otpResendUseCase(
      ForgotPasswordRequest(email: email),
    );

    _loader.sink.add(false);
    emit(state.copyWith(enableNext: false));

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(
        message: errorMessage.message,
        isError: true,
      ));
      return;
    } else {
      final forgotPasswordResponse = response.asValue!.value;
      _resendMessage.sink.add("OTP has been sent successfully.");
      _saveTokenResend(forgotPasswordResponse);
    }
  }

  void _saveTokenResend(ForgotPasswordResponse response) async {
    await _authStore.setToken(
      response.token,
    );
  }

  @override
  Future<void> close() {
    _resendMessage.close();
    _navigation.close();
    _loader.close();
    _message.close();
    return super.close();
  }
}
