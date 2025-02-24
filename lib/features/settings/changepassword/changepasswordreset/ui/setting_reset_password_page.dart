import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/common/constants.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/global_keys.dart';
import 'package:well_path/corewidgets/notification_action_app_bar_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';
import 'package:well_path/corewidgets/app_text_field.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/cubit/setting_reset_password_cubit.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/cubit/setting_reset_password_navigation.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/models/setting_reset_password_state.dart';
import 'package:well_path/gen/assets.gen.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';
import 'package:well_path/widgets/success_dialog.dart';

class SettingResetPasswordPage extends StatefulWidget {
  static const route = '/change-password-reset';
  const SettingResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<SettingResetPasswordPage> createState() =>
      _SettingResetPasswordPageState();
}

class _SettingResetPasswordPageState extends State<SettingResetPasswordPage>
    with Loading, Message {
  late final _cubit = context.read<SettingResetPasswordCubit>();
  bool obscureText = true;
  bool obscureConfirmText = true;

  @override
  void initState() {
    super.initState();
    _cubit.setToken();
    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
  }

  void _initNavigationListener() {
    _cubit.navigation.listen((event) {
      switch (event) {
        case SettingResetPasswordNavigation.successDialog:
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
      buttonText: 'Done',
      onPressed: _navigateToSettings,
    );
  }

  void _navigateToSettings() {
    navigatorKey.currentState
      ?..pop()
      ..pop()
      ..pop()
      ..pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WellPathAppBar(
        leading: AppBarBackButton(
          onBackPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          NotificationActionButton(onNotificationPressed: () {
            navigateToNotification();
          }),
        ],
      ),
      body: BlocBuilder<SettingResetPasswordCubit, SettingResetPasswordState>(
          builder: (context, state) {
        return Stack(
          children: [
            SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Reset Password",
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Enter a new password and confirm it.",
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          AppTextField(
                            hintText: 'Password',
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.45,
                          ),
                          WellPathButton(
                            onPressed: state.enableNext ? _cubit.submit : null,
                            buttonText: "Reset Password",
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
