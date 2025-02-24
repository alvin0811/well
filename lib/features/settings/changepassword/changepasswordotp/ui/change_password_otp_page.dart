import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_path/common/constants.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/notification_action_app_bar_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/view/widget/pin_code_text_field.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/cubit/change_password_otp_cubit.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/models/change_password_otp_state.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/ui/setting_reset_password_page.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';

class ChangePasswordOtpPage extends StatefulWidget {
  static const route = '/change-password-otp';
  const ChangePasswordOtpPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordOtpPage> createState() => _ChangePasswordOtpPageState();
}

class _ChangePasswordOtpPageState extends State<ChangePasswordOtpPage>
    with Loading, Message {
  late final _cubit = context.read<ChangePasswordOtpCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.setToken();
    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
  }

  void _initNavigationListener() {
    _cubit.navigation.listen(
      (event) {
        _navigateToOtpVerificationPage(event.otp);
      },
    );
  }

  void _navigateToOtpVerificationPage(String otp) {
    context.navigator.popAndPushNamed(
      SettingResetPasswordPage.route,
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
      body: BlocBuilder<ChangePasswordOtpCubit, ChangePasswordOtpState>(
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
                        "Enter the OTP received on your \n email address",
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: OtpTextField(
                              onChanged: _cubit.otpChanged,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          WellPathButton(
                            onPressed: state.enableNext ? _cubit.submit : null,
                            buttonText: "Verify Email",
                          ),
                          const SizedBox(
                            height: 20,
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
