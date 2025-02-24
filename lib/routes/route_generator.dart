import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/di/injectable.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/cubit/forgot_password_cubit.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/cubit/otp_verification_cubit.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/view/otp_verification_page.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/cubit/reset_password_cubit.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/view/reset_password_page.dart';
import 'package:well_path/features/authenthication/login/cubit/login_cubit.dart';
import 'package:well_path/features/authenthication/login_with_touch/cubit/login_with_touch_id_cubit.dart';
import 'package:well_path/features/authenthication/login_with_touch/ui/login_with_touch_id_page.dart';
import 'package:well_path/features/authenthication/signup/cubit/signup_cubit.dart';
import 'package:well_path/features/authenthication/signup/ui/signup_page.dart';
import 'package:well_path/features/homescreens/home/bp_record/cubit/bp_record_cubit.dart';
import 'package:well_path/features/homescreens/home/cubit/home_cubit.dart';
import 'package:well_path/features/notification/cubit/notification_cubit.dart';
import 'package:well_path/features/notification/ui/notification_view.dart';

import 'package:well_path/features/onboarding/food/cubit/food_cubit.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/cubit/lifestyle_element_cubit.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/ui/selected_lifestyle_elements_page.dart';
import 'package:well_path/features/onboarding/physical_activity/cubit/physical_activity_cubit.dart';
import 'package:well_path/features/onboarding/sleep/cubit/sleep_cubit.dart';
import 'package:well_path/features/settings/bmicalculator/settings_bmi_calculation_page.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/cubit/change_password_cubit.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/cubit/change_password_otp_cubit.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/cubit/setting_reset_password_cubit.dart';
import 'package:well_path/features/settings/cubit/settings_cubit.dart';
import 'package:well_path/features/settings/editprofile/cubit/edit_profile_cubit.dart';
import 'package:well_path/features/settings/editprofile/ui/edit_profile_view.dart';
import 'package:well_path/features/settings/bptutorial/bp_tutorial_one_page.dart';
import 'package:well_path/features/settings/bptutorial/bp_tutorial_three_page.dart';
import 'package:well_path/features/settings/bptutorial/bp_tutorial_two_page.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/ui/change_password_confirm_email_page.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/ui/change_password_otp_page.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/ui/setting_reset_password_page.dart';
import 'package:well_path/features/settings/health_facts/view/health_facts_details_page.dart';
import 'package:well_path/features/settings/health_facts/view/health_facts_page.dart';
import 'package:well_path/features/settings/privacypolicy/ui/privacy_policy_page.dart';
import 'package:well_path/features/settings/ui/settings_view.dart';
import 'package:well_path/features/settings/weightlosstracker/cubit/weight_loss_cubit.dart';
import 'package:well_path/features/settings/weightlosstracker/weight_loss_settings_page.dart';
import 'package:well_path/features/onboarding/bmi_calculations/cubit/bmi_calculation_cubit.dart';
import 'package:well_path/features/onboarding/demographics/cubit/demographics_cubit.dart';
import 'package:well_path/features/onboarding/meditation/cubit/medications_cubit.dart';
import 'package:well_path/features/onboarding/stress/cubit/stress_cubit.dart';
import '../features/authenthication/forgotpassword/ui/forgotpassword_page/forgot_password_page.dart';
import '../features/authenthication/login/ui/login_page.dart';
import '../features/homescreens/home/ui/home_page.dart';
import '../features/onboarding/bmi_calculations/ui/bmi_calculation_page.dart';
import '../features/onboarding/demographics/ui/demographic_page.dart';
import '../features/onboarding/food/ui/food_page.dart';
import '../features/onboarding/lifestyle_elements/ui/lifestyle_elements_page.dart';
import '../features/onboarding/meditation/ui/meditation_page.dart';
import '../features/onboarding/physical_activity/ui/physical_activity_page.dart';
import '../features/onboarding/sleep/ui/sleep_page.dart';
import '../features/onboarding/stress/ui/stress_page.dart';
import '../features/splash/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings route) {
    final args = route.arguments;
    switch (route.name) {
      case SplashScreen.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                SplashScreen(
                  authStore: getIt<AuthStore>(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //   builder: (context) => SplashScreen(
      //     authStore: getIt<AuthStore>(),
      //   ),
      //   settings: route,
      // );
      case SignUpPage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (context) {
                    return getIt<SignupCubit>();
                  },
                  child: const SignUpPage(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);

      // return MaterialPageRoute(
      //   builder: (_) => BlocProvider(
      //     create: (context) {
      //       return getIt<SignupCubit>();
      //     },
      //     child: const SignUpPage(),
      //   ),
      //   settings: route,
      // );
      case LoginPage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (_) => getIt<LoginCubit>(),
                  child: const LoginPage(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //   builder: (context) => BlocProvider(
      //     create: (_) => getIt<LoginCubit>(),
      //     child: const LoginPage(),
      //   ),
      //   settings: route,
      // );
      case ForgotPasswordPage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (_) => getIt<ForgotPasswordCubit>(),
                  child: const ForgotPasswordPage(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //   builder: (context) => BlocProvider(
      //     create: (_) => getIt<ForgotPasswordCubit>(),
      //     child: const ForgotPasswordPage(),
      //   ),
      //   settings: route,
      // );
      case OtpVerificationPage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (_) => getIt<OtpVerificationCubit>(param1: args),
                  child: const OtpVerificationPage(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //   builder: (context) => BlocProvider(
      //     create: (_) => getIt<OtpVerificationCubit>(param1: args),
      //     child: const OtpVerificationPage(),
      //   ),
      //   settings: route,
      // );
      case ResetPasswordPage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (_) => getIt<ResetPasswordCubit>(),
                  child: ResetPasswordPage(authStore: getIt<AuthStore>()),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //   builder: (context) => BlocProvider(
      //     create: (_) => getIt<ResetPasswordCubit>(),
      //     child: ResetPasswordPage(authStore: getIt<AuthStore>()),
      //   ),
      //   settings: route,
      // );
      case LoginWithTouchIdPage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (_) => getIt<LoginWithTouchIdCubit>(),
                  child: const LoginWithTouchIdPage(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //   builder: (context) => BlocProvider(
      //     create: (_) => getIt<LoginWithTouchIdCubit>(),
      //     child: const LoginWithTouchIdPage(),
      //   ),
      //   settings: route,
      // );
      case DemographicPage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (_) => getIt<DemographicCubit>(),
                  child: const DemographicPage(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //   builder: (context) => BlocProvider(
      //     create: (_) => getIt<DemographicCubit>(),
      //     child: const DemographicPage(),
      //   ),
      //   settings: route,
      // );
      case BmiCalculationPage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (_) => getIt<BmiCalculationCubit>(),
                  child: const BmiCalculationPage(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //   builder: (context) => BlocProvider(
      //     create: (_) => getIt<BmiCalculationCubit>(),
      //     child: const BmiCalculationPage(),
      //   ),
      //   settings: route,
      // );
      case MeditationPage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (_) => getIt<MeditationCubit>(),
                  child: const MeditationPage(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //   builder: (context) => BlocProvider(
      //     create: (_) => getIt<MeditationCubit>(),
      //     child: const MeditationPage(),
      //   ),
      //   settings: route,
      // );
      case StressPage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (_) => getIt<StressCubit>(),
                  child: const StressPage(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //   builder: (context) => BlocProvider(
      //     create: (_) => getIt<StressCubit>(),
      //     child: const StressPage(),
      //   ),
      // );
      case PhysicalActivityPage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (_) => getIt<PhysicalActivityCubit>(),
                  child: const PhysicalActivityPage(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //           create: (_) => getIt<PhysicalActivityCubit>(),
      //           child: const PhysicalActivityPage(),
      //         ));
      case FoodPage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (_) => getIt<FoodCubit>(),
                  child: const FoodPage(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //           create: (_) => getIt<FoodCubit>(),
      //           child: const FoodPage(),
      //         ));
      case SleepPage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (context) => getIt<SleepCubit>(),
                  child: const SleepPage(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //           create: (context) => getIt<SleepCubit>(),
      //           child: const SleepPage(),
      //         ));
      case LifeStyleElementPage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (context) => getIt<LifestyleElementCubit>(),
                  child: const LifeStyleElementPage(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //           create: (context) => getIt<LifestyleElementCubit>(),
      //           child: const LifeStyleElementPage(),
      //         ));
      case SelectedLifeStyleElementsWidget.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (context) => getIt<LifestyleElementCubit>(),
                  child: SelectedLifeStyleElementsWidget(
                      authStore: getIt<AuthStore>()),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //           create: (context) => getIt<LifestyleElementCubit>(),
      //           child: SelectedLifeStyleElementsWidget(
      //               authStore: getIt<AuthStore>()),
      //         ));
      case HomePage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                MultiBlocProvider(
                  providers: [
                    BlocProvider<HomeCubit>(
                        create: (context) => getIt<HomeCubit>()),
                    BlocProvider<BpRecordCubit>(
                        create: (context) => getIt<BpRecordCubit>()),
                  ],
                  child: const HomePage(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //     builder: (_) => MultiBlocProvider(
      //           providers: [
      //             BlocProvider<HomeCubit>(
      //                 create: (context) => getIt<HomeCubit>()),
      //             BlocProvider<BpRecordCubit>(
      //                 create: (context) => getIt<BpRecordCubit>()),
      //           ],
      //           child: const HomePage(),
      //         ));

      case SettingsPage.route:
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (context) => getIt<SettingCubit>(),
                  child: const SettingsPage(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            settings: route);
      // return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //           create: (context) => getIt<SettingCubit>(),
      //           child: const SettingsPage(),
      //         ));
      case EditProfilePage.route:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<EditProfileCubit>(),
            child: const EditProfilePage(),
          ),
          settings: route,
        );
      case ChangePasswordConfirmEmailPage.route:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<ChangePasswordCubit>(),
            child: const ChangePasswordConfirmEmailPage(),
          ),
        );
      case ChangePasswordOtpPage.route:
        final params = route.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<ChangePasswordOtpCubit>(param1: params),
            child: const ChangePasswordOtpPage(),
          ),
        );
      case SettingResetPasswordPage.route:
        final params = route.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<SettingResetPasswordCubit>(param1: params),
            child: const SettingResetPasswordPage(),
          ),
        );
      case "/bptutorialone":
        return MaterialPageRoute(
            builder: (_) => const BpTutorialOneSettingPage());
      case "/bptutorialtwo":
        return MaterialPageRoute(
            builder: (_) => const BpTutorialTwoSettingPage());
      case "/bptutorialthree":
        return MaterialPageRoute(
            builder: (_) => const BpTutorialThreeSettingPage());
      // case WeightLossSettingPage.route:
      //   return MaterialPageRoute(builder: (_) => const WeightLossSettingPage());
      case WeightLossSettingPage.route:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<WeightLossSettingCubit>(),
            child: const WeightLossSettingPage(),
          ),
        );

      case "/settings_bmi_calculations":
        return MaterialPageRoute(
            builder: (_) => const SettingsBmiCalculationPage());
      case HealthFactsPage.route:
        return MaterialPageRoute(
          builder: (context) => const HealthFactsPage(),
          settings: route,
        );
      case HealthFactsDetailsPage.route:
        return MaterialPageRoute(
          builder: (context) => const HealthFactsDetailsPage(),
          settings: route,
        );
      case "/privacy-policy":
        return MaterialPageRoute(
          builder: (context) => const PrivacyPolicyPage(),
          settings: route,
        );
      case NotificationPage.route:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<NotificationCubit>(),
            child: const NotificationPage(),
          ),
          settings: route,
        );
      default:
        return null;
    }
  }
}
