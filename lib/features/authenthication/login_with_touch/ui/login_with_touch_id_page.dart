import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/corewidgets/app_text_field.dart';
import 'package:well_path/corewidgets/app_check_box.dart';
import 'package:well_path/corewidgets/wellPath_secondary_button.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/authenthication/login_with_touch/cubit/login_with_touch_id_cubit.dart';
import 'package:well_path/features/authenthication/login_with_touch/cubit/login_with_touch_id_navigation_enums.dart';
import 'package:well_path/features/authenthication/login_with_touch/models/login_with_touch_id_state.dart';
import 'package:well_path/features/authenthication/signup/ui/signup_page.dart';
import 'package:well_path/features/homescreens/home/ui/home_page.dart';
import 'package:well_path/gen/assets.gen.dart';
import 'package:well_path/helper/logger/logger.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';
import 'package:local_auth/local_auth.dart';

class LoginWithTouchIdPage extends StatefulWidget {
  static const route = '/login-with-touch-id-page';
  const LoginWithTouchIdPage({super.key});

  @override
  State<LoginWithTouchIdPage> createState() => _LoginWithTouchIdPageState();
}

class _LoginWithTouchIdPageState extends State<LoginWithTouchIdPage>
    with Loading, Message {
  late final _cubit = context.read<LoginWithTouchIdCubit>();
  late final authStore = AuthStore();
  bool obscureText = true;
  late final auth = LocalAuthentication();
  late List<BiometricType> _availableBiometric;
  bool _canCheckBiometric = false;
  bool? isBioMetricEnabled = false;
  @override
  void initState() {
    super.initState();
    _checkBiometric();

    _getAvailableBiometric();
    
    _getIsBioMetricEnabled();

    _initNavigationListener();

    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
  }

  void _getIsBioMetricEnabled() async {
    isBioMetricEnabled = await authStore.getIsBioMetricEnabled();
    if (isBioMetricEnabled == true) {
      _cubit.loginAfterTouchID();
      // _cubit.authenticate();
    }
    Logger.e(isBioMetricEnabled.toString());
  }

  void _initNavigationListener() {
    _cubit.navigation.listen(
      (event) {
        switch (event) {
          case LoginWithTouchIdNavigation.home:
            _navigateToHome();
            break;
        }
      },
    );
  }

  void _navigateToHome() {
    // context.navigator.popUntil((route) => false);
    context.navigator.pushNamed(HomePage.route);
  }

  Future<void> _checkBiometric() async {
    bool canCheckBiometric = false;

    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      BotToast.showText(text: e.message.toString());
    }

    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future _getAvailableBiometric() async {
    List<BiometricType> availableBiometric = [];

    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      BotToast.showText(text: e.message.toString());
    }

    setState(() {
      _availableBiometric = availableBiometric;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Stack(
            children: [
              Image.asset(
                "assets/images/wellpath_bg.png",
                width: double.maxFinite,
                height: double.maxFinite,
                fit: BoxFit.cover,
              ),
              SafeArea(
                child: SingleChildScrollView(child:
                    BlocBuilder<LoginWithTouchIdCubit, LoginWithTouchIdState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          width: 100,
                          height: 70,
                          child: Image.asset("assets/images/well_logo.png"),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          "TouchID/FaceID",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "Please enter username and password to enable biometric",
                            style: Theme.of(context).textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        AppTextField(
                          hintText: 'Email Address',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 17.0),
                            child: Image.asset(
                              'assets/images/ic_email.png',
                              width: 10,
                              height: 10,
                            ),
                          ),
                          suffixIcon: null,
                          inputType: TextInputType.emailAddress,
                          onChanged: _cubit.onEmailChanged,
                          action: TextInputAction.next,
                          error: state.email.error.toLocalizedString(context),
                          obscureText: false,
                        ),
                        const SizedBox(
                          height: 20,
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
                                  ? Assets.images.icPasswordOpenEye
                                  : Assets.images.icPasswordEye,
                              width: 20,
                            ),
                          ),
                          action: TextInputAction.next,
                          onChanged: _cubit.onPasswordChanged,
                          obscureText: obscureText,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            AppCheckBox(
                              isChecked: state.termsAndConditions,
                              onChanged: _cubit.onTermsAndConditions,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                'I agree to Terms and Conditions',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AppCheckBox(
                              isChecked: state.touchIdPermission,
                              onChanged: _cubit.onTouchIdPermission,
                            ),
                            const Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  'Please note that any TouchID or FaceId stored on this phone can be used by WellPath app',
                                  style: TextStyle(fontSize: 12),
                                  softWrap: true,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: WellPathSecondaryButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  buttonText: Text(
                                    "Cancel",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: WellPathButton(
                                  onPressed:
                                      state.enableNext ? _cubit.login : null,
                                  buttonText: 'Enable',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Don\'t have an account?',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: const Color(0xFFA9A9A9), fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            context.navigator.popAndPushNamed(SignUpPage.route);
                          },
                          child: Text(
                            'Register',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    color: const Color(0xFF4AB7C3),
                                    fontSize: 14),
                          ),
                        ),
                      ],
                    );
                  },
                )),
              ),
            ],
          ),
        ));
  }
}
