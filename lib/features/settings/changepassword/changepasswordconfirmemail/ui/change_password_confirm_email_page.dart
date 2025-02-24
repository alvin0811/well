import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/common/constants.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/app_text_field.dart';
import 'package:well_path/corewidgets/notification_action_app_bar_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/cubit/change_password_cubit.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/cubit/change_password_navigation_enums.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/models/change_password_state.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/ui/change_password_otp_page.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';

class ChangePasswordConfirmEmailPage extends StatefulWidget {
  static const route = '/change-password';
  const ChangePasswordConfirmEmailPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordConfirmEmailPage> createState() =>
      _ChangePasswordConfirmEmailPageState();
}

class _ChangePasswordConfirmEmailPageState
    extends State<ChangePasswordConfirmEmailPage> with Loading, Message {
  late final _cubit = context.read<ChangePasswordCubit>();
  final TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _initChangePasswordTextField();
    _initNavigationListener();
    _cubit.getUserFromAuthStore();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
  }

  void _initNavigationListener() {
    _cubit.updateText.listen(
      (event) {
        confirmPasswordTextEditingController.text = event.toString();
      },
    );
  }

  void _initChangePasswordTextField() {
    _cubit.navigation.listen(
      (event) {
        if (event is OtpChangePasswordNavigation) {
          _navigateToOtpVerificationPage(event.otp);
        }
      },
    );
  }

  void _navigateToOtpVerificationPage(String otp) {
    context.navigator.popAndPushNamed(
      ChangePasswordOtpPage.route,
      arguments: otp,
    );
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
      body: BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
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
                        SvgPicture.asset(
                          "assets/images/ic_changepassword.svg",
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Confirm Email Address",
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "A One Time Password will sent to \n your email address",
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppTextField(
                              textEditingController:
                                  confirmPasswordTextEditingController,
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
                              height: 20,
                            ),
                            WellPathButton(
                              onPressed:
                                  state.enableNext ? _cubit.submit : null,
                              buttonText: "Get OTP",
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
        },
      ),
    );
  }
}
