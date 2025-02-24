import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/common/constants.dart';
import 'package:well_path/corewidgets/app_text_field.dart';
import 'package:well_path/corewidgets/app_check_box.dart';
import 'package:well_path/corewidgets/global_keys.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/fcm/firebase_api.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/forgot_password_page.dart';
import 'package:well_path/features/authenthication/login/cubit/login_cubit.dart';
import 'package:well_path/features/authenthication/login/cubit/login_navigation_enums.dart';
import 'package:well_path/features/authenthication/login/models/login_state.dart';
import 'package:well_path/features/authenthication/login_with_touch/ui/login_with_touch_id_page.dart';
import 'package:well_path/features/authenthication/signup/ui/signup_page.dart';
import 'package:well_path/features/homescreens/home/ui/home_page.dart';
import 'package:well_path/features/notification/ui/notification_view.dart';
import 'package:well_path/gen/assets.gen.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';
import 'package:well_path/main.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Loading, Message {
  late final _cubit = context.read<LoginCubit>();
  bool obscureText = true;
  bool _resolved = false;
  String? initialMessage;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then(
          (value) => setState(
            () {
              _resolved = true;
              initialMessage = value?.data.toString();
            },
          ),
        );

    FirebaseMessaging.onMessage.listen(showFlutterNotification);
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // navigateToNotification();
    });

    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
  }

  void _initNavigationListener() {
    _cubit.navigation.listen((event) {
      switch (event) {
        case LoginNavigation.home:
          _navigateToHomeScreen();
          break;
        case LoginNavigation.signup:
          _navigateToHomeScreen();
          break;
      }
    });
  }

  Route createRoute(Widget destination) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  void _navigateToSignUp() {
    //  Navigator.popAndPushNamed(context, SignUpPage.route);
    Navigator.of(context).pushNamedAndRemoveUntil(
        SignUpPage.route, (Route<dynamic> route) => false);
    // context.navigator.popAndPushNamed(SignUpPage.route);
  }

  void _navigateToHomeScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        HomePage.route, (Route<dynamic> route) => false);
    // context.navigator.popAndPushNamed(HomePage.route);
  }

  void _navigateToForgotPassword() {
    context.navigator.pushNamed(ForgotPasswordPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return Column(
                      children: <Widget>[
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
                          "Welcome Back",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          "Sign in to continue",
                          style: Theme.of(context).textTheme.headlineSmall,
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
                                  ? Assets.images.icPasswordEye
                                  : Assets.images.icPasswordOpenEye,
                              width: 20,
                            ),
                          ),
                          action: TextInputAction.done,
                          onChanged: _cubit.onPasswordChanged,
                          obscureText: obscureText,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            AppCheckBox(
                              isChecked: state.rememberMe,
                              onChanged: _cubit.onRememberMe,
                            ),
                            Text(
                              '  Remember me',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: const Color(0xFF235564)),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: _navigateToForgotPassword,
                                    child: Text(
                                      'Forgot Password?',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        WellPathButton(
                          buttonText: 'Sign In',
                          onPressed: state.enableNext ? _cubit.login : null,
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
                                color: Colors.black,
                                fontSize: 14,
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: _navigateToSignUp,
                          child: Text(
                            'Register',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    color: const Color(0xFF4AB7C3),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Login with TouchID/FaceID',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              elevation: 3,
                              heroTag: "touch_id",
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(LoginWithTouchIdPage.route);
                              },
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(
                                "assets/images/ic_authone.svg",
                                width: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              elevation: 3,
                              heroTag: "face_id",
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(LoginWithTouchIdPage.route);
                              },
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(
                                "assets/images/ic_authtwo.svg",
                                width: 50,
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
