import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/cubit/otp_verification_cubit.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/cubit/otp_verification_navigation_enums.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/models/otp_verification_state.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/view/widget/pin_code_text_field.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/view/reset_password_page.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';

class OtpVerificationPage extends StatefulWidget {
  static const route = 'otp-verification';
  const OtpVerificationPage({
    Key? key,
  }) : super(key: key);
  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage>
    with Loading, Message {
  late final _cubit = context.read<OtpVerificationCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.setEmail();
    _initResendOtpMessage();
    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
  }

  void _initNavigationListener() {
    _cubit.navigation.listen(
      (event) {
        if (event is VerificationNavigation) {
          _navigateToResetPassword();
        }
      },
    );
  }

  void _initResendOtpMessage() {
    _cubit.resendMessage.listen(
      (event) {
        BotToast.showText(text: event.toString());
      },
    );
  }

  void _navigateToResetPassword() {
    context.navigator.pushNamed(ResetPasswordPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              "assets/images/wellpath_bg.png",
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.cover,
            ),
            SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child:
                        BlocBuilder<OtpVerificationCubit, OtpVerificationState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              width: 200,
                              height: 160,
                              child: SvgPicture.asset(
                                "assets/images/ic_forgotpassword.svg",
                                width: 25,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Forgot Password?",
                              style: Theme.of(context).textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Enter OTP",
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Please enter the 4-digit code sent to \n ${state.email}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(color: Colors.black, fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: OtpTextField(
                                onChanged: _cubit.otpChanged,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Didn\'t Receive the Code?',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      color: const Color(0xFFA9A9A9),
                                      fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                _cubit.resend(state.email);
                              },
                              child: Text(
                                'Resend',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        color: const Color(0xFF4AB7C3),
                                        fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            WellPathButton(
                              buttonText: 'Verify',
                              onPressed:
                                  state.enableNext ? _cubit.verifyOtp : null,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
