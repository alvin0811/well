import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_path/common/constants.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/global_keys.dart';
import 'package:well_path/corewidgets/notification_action_app_bar_button.dart';
import 'package:well_path/corewidgets/settings_action_app_bar_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';
import 'package:well_path/features/homescreens/home/cubit/home_cubit.dart';

class DashDietPage extends StatefulWidget {
  const DashDietPage({super.key});

  @override
  State<DashDietPage> createState() => _DashDietPageState();
}

class _DashDietPageState extends State<DashDietPage> {
  @override
  Widget build(BuildContext context) {
    late final cubit = context.read<HomeCubit>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WellPathAppBar(
        leading: AppBarBackButton(
          onBackPressed: () {
            cubit.updateTabs(0);
          },
        ),
        actions: [
          NotificationActionButton(onNotificationPressed: () {
            navigateToNotification();
          }),
          SettingsActionButton(onSettingPressed: () {
            navigatorKey.currentState?.pushNamed('/settings');
          })
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg_onboard.png",
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Dash Diet',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 15),
                    Image.asset(
                      'assets/images/ic_dash_diet_dummy.png',
                      width: MediaQuery.of(context).size.width,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Dash Diet is important for living a healthy life',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 13),
                    ),
                    const SizedBox(height: 30),
                    WellPathButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/detail');
                        },
                        buttonText: 'Learn More')
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
