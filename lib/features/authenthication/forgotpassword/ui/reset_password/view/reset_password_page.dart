import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/corewidgets/app_text_field.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/cubit/reset_password_cubit.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/cubit/reset_password_navigation_enums.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/models/reset_password_state.dart';
import 'package:well_path/features/authenthication/login/ui/login_page.dart';
import 'package:well_path/gen/assets.gen.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';
import 'package:well_path/widgets/success_dialog.dart';

class ResetPasswordPage extends StatefulWidget {
  static const route = 'reset-password';
  const ResetPasswordPage({
    Key? key,
    required this.authStore,
  }) : super(key: key);
  final AuthStore authStore;
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage>
    with Loading, Message {
  late final _cubit = context.read<ResetPasswordCubit>();
  bool obscureText = true;
  bool obscureConfirmText = true;
  @override
  void initState() {
    super.initState();
    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
  }

  void _initNavigationListener() {
    _cubit.navigation.listen((event) {
      switch (event) {
        case ResetPasswordNavigation.successDialog:
          _navigateToResetPasswordSuccessDialog();
          break;
      }
    });
  }

  void _navigateToResetPasswordSuccessDialog() {
    showSuccessDialog(
      context,
      title: 'Congratulations!',
      subTitle: 'Password Reset successfully',
      buttonText: 'Back to Login',
      onPressed: _signOut,
    );
  }

  void _signOut() async {
    await widget.authStore.signOut();
    _moveToLoginPage();
  }

  void _moveToLoginPage() {
    Navigator.of(context, rootNavigator: true)
        .pushNamedAndRemoveUntil(LoginPage.route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SingleChildScrollView(
                child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SvgPicture.asset(
                            "assets/images/ic_forgotpasswordreset.svg",
                            width: 256,
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
                          "Create Your New Password",
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        AppTextField(
                          hintText: 'Password',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Image.asset(
                              'assets/images/ic_password_lock.png',
                              width: 10,
                              height: 10,
                            ),
                          ),
                          inputType: TextInputType.visiblePassword,
                          error:
                              state.password.error.toLocalizedString(context),
                          suffixIcon: IconButton(
                            iconSize: 24,
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: SvgPicture.asset(
                              obscureText
                                  ? Assets.images.icPasswordEye
                                  : Assets.images.icPasswordOpenEye,
                              width: 25,
                            ),
                          ),
                          action: TextInputAction.next,
                          onChanged: _cubit.onPasswordChanged,
                          obscureText: obscureText,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppTextField(
                          hintText: 'Confirm Password',
                          error: state.confirmPassword.error
                              .toLocalizedString(context),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Image.asset(
                              'assets/images/ic_password_lock.png',
                              width: 10,
                              height: 10,
                            ),
                          ),
                          action: TextInputAction.done,
                          inputType: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                            iconSize: 24,
                            onPressed: () {
                              setState(() {
                                obscureConfirmText = !obscureConfirmText;
                              });
                            },
                            icon: SvgPicture.asset(
                             obscureConfirmText
                                  ? Assets.images.icPasswordEye
                                  : Assets.images.icPasswordOpenEye,
                              width: 25,
                            ),
                          ),
                          onChanged: _cubit.onConfirmPasswordChanged,
                          obscureText: obscureConfirmText,
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: WellPathButton(
                            buttonText: 'Reset Password',
                            onPressed: state.enableNext ? _cubit.submit : null,
                            // state.enableNext ? _cubit.submit : null,
                          ),
                        )
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
