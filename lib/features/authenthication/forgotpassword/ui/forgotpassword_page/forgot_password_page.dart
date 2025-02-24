import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/corewidgets/app_text_field.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/cubit/forgot_password_cubit.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/cubit/forgot_password_navigation_enums.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/models/forgot_password_state.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/view/otp_verification_page.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const route = 'forgot-password';
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with Loading, Message {
  late final _cubit = context.read<ForgotPasswordCubit>();

  @override
  void initState() {
    super.initState();
    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
  }

  void _initNavigationListener() {
    _cubit.navigation.listen(
      (event) {
        if (event is OtpForgotPasswordNavigation) {
          _navigateToOtpVerificationPage(event.email);
        }
      },
    );
  }

  void _navigateToOtpVerificationPage(String email) {
    context.navigator.popAndPushNamed(
      OtpVerificationPage.route,
      arguments: email,
    );
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: SingleChildScrollView(
                    child:
                        BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
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
                              "Enter Email Address",
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Enter your Email address to receive a One Time Password",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(color: Colors.black, fontSize: 13),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            AppTextField(
                              hintText: 'Email Address',
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 17.0),
                                child: Image.asset(
                                  'assets/images/ic_email.png',
                                  width: 10,
                                  height: 10,
                                ),
                              ),
                              suffixIcon: null,
                              inputType: TextInputType.emailAddress,
                              onChanged: _cubit.onEmailChanged,
                              action: TextInputAction.done,
                              error:
                                  state.email.error.toLocalizedString(context),
                              obscureText: false,
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: WellPathButton(
                                  buttonText: 'Get OTP',
                                  onPressed:
                                      state.enableNext ? _cubit.submit : null),
                            ),
                            const SizedBox(
                              height: 20,
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
