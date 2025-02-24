import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/common/constants.dart';

import '../../../../corewidgets/app_bar_back_button.dart';
import '../../../../corewidgets/global_keys.dart';
import '../../../../corewidgets/notification_action_app_bar_button.dart';
import '../../../../corewidgets/settings_action_app_bar_button.dart';
import '../../../../corewidgets/well_path_app_bar.dart';
import '../../../../corewidgets/wellpathbutton.dart';

class DashDietMealPlanDetailPage extends StatelessWidget {
  const DashDietMealPlanDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
          SettingsActionButton(onSettingPressed: () {
            navigatorKey.currentState?.pushNamed('/settings');
          })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/ic_dash_diet_.png',
            fit: BoxFit.cover,
            width: double.maxFinite,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vegetables',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad. minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 13),
                      ),
                      const SizedBox(height: 25),
                      const BulletPointWidget(),
                      const SizedBox(height: 10),
                      const BulletPointWidget(),
                      const SizedBox(height: 10),
                      const BulletPointWidget(),
                      const SizedBox(height: 10),
                      const BulletPointWidget(),
                      const SizedBox(height: 10),
                      const BulletPointWidget(),
                      const SizedBox(height: 30),
                      WellPathButton(onPressed: () {}, buttonText: 'Learn More')
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BulletPointWidget extends StatelessWidget {
  const BulletPointWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/ic_checkmark.svg',
        ),
        const SizedBox(width: 8),
        Text(
          'Meal Plan',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
