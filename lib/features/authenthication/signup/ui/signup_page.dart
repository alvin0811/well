import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/corewidgets/app_text_field.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/authenthication/login/ui/login_page.dart';
import 'package:well_path/features/authenthication/signup/cubit/signup_cubit.dart';
import 'package:well_path/features/authenthication/signup/cubit/signup_navigation_enums.dart';
import 'package:well_path/features/authenthication/signup/models/signup_state.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/onboarding/demographics/ui/demographic_page.dart';
import 'package:well_path/gen/assets.gen.dart';
import 'package:well_path/helper/helpers.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpPage extends StatefulWidget {
  static const route = '/signup';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with Loading, Message {
  late final _cubit = context.read<SignupCubit>();

  bool passwordObscureText = true;
  bool confirmPasswordObscureText = true;

  final _phoneNumberFormatter = MaskTextInputFormatter(
    mask: mask,
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );

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
        case SignupNavigation.login:
          _navigateToDemographic();
          break;
      }
    });
  }

  void _navigateToDemographic() {
    getIt<AuthStore>().setIsComingFromSettings(false);
    context.navigator.popAndPushNamed(DemographicPage.route);
  }

  void _navigateToLoginPage() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        LoginPage.route, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/wellpath_bg.png",
                  width: double.maxFinite,
                  height: double.maxFinite,
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        wellPathLogoImage(),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Text(
                                "Create Your Account",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              Text(
                                "Let’s get Started",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        AppTextField(
                          hintText: 'Name',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: SvgPicture.asset(
                              'assets/images/icon_person.svg',
                              width: 10,
                              height: 10,
                            ),
                          ),
                          suffixIcon: null,
                          error: state.name.error.toLocalizedString(context),
                          onChanged: _cubit.onNameChanged,
                          inputType: TextInputType.text,
                          obscureText: false,
                          action: TextInputAction.next,
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          hintText: 'Email Address',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 17.0),
                            child: SvgPicture.asset(
                              'assets/images/ic_email.svg',
                              width: 5,
                              height: 5,
                            ),
                          ),
                          suffixIcon: null,
                          inputType: TextInputType.emailAddress,
                          onChanged: _cubit.onEmailChanged,
                          action: TextInputAction.next,
                          error: state.email.error.toLocalizedString(context),
                          obscureText: false,
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          hintText: 'Phone Number',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: SvgPicture.asset(
                              'assets/images/icon_phone.svg',
                              width: 10,
                              height: 10,
                            ),
                          ),
                          suffixIcon: null,
                          inputType: TextInputType.phone,
                          error: state.phone.error.toLocalizedString(context),
                          onChanged: _cubit.onPhoneChanged,
                          obscureText: false,
                          action: TextInputAction.next,
                       //   textInputFormatter: [_phoneNumberFormatter],
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          hintText: 'Password',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 13.0),
                            child: SvgPicture.asset(
                              'assets/images/ic_password_lock.svg',
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
                                passwordObscureText = !passwordObscureText;
                              });
                            },
                            icon: SvgPicture.asset(
                              passwordObscureText
                                  ? Assets.images.icPasswordEye
                                  : Assets.images.icPasswordOpenEye,
                              width: 25,
                            ),
                          ),
                          action: TextInputAction.next,
                          onChanged: _cubit.onPasswordChanged,
                          obscureText: passwordObscureText,
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          hintText: 'Confirm Password',
                          error: state.confirmPassword.error
                              .toLocalizedString(context),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 13.0),
                            child: SvgPicture.asset(
                              'assets/images/ic_password_lock.svg',
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
                                confirmPasswordObscureText =
                                    !confirmPasswordObscureText;
                              });
                            },
                            icon: SvgPicture.asset(
                              confirmPasswordObscureText
                                  ? Assets.images.icPasswordEye
                                  : Assets.images.icPasswordOpenEye,
                              width: 25,
                            ),
                          ),
                          onChanged: _cubit.onConfirmPasswordChanged,
                          obscureText: confirmPasswordObscureText,
                        ),
                        const SizedBox(height: 60),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: const Color(0xFF235564),
                                elevation: 10),
                            onPressed:
                                state.enableNext ? _cubit.register : null,
                            child: const Text(
                              'Register',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Already have an account?',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: const Color(0xFF252525),
                                fontSize: 14,
                              ),
                        ),
                        SizedBox(
                          height: 30,
                          child: TextButton(
                            onPressed: _navigateToLoginPage,
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                padding: EdgeInsets.zero),
                            child: Text(
                              'Sign in',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: const Color(0xFF4AB7C3),
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget wellPathLogoImage() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    width: 100,
    height: 70,
    child: Image.asset("assets/images/well_logo.png"),
  );
}
