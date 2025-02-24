import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_path/common/constants.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/global_keys.dart';
import 'package:well_path/corewidgets/notification_action_app_bar_button.dart';
import 'package:well_path/corewidgets/settings_action_app_bar_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';

class DashDietDetailsPage extends StatelessWidget {
  const DashDietDetailsPage({super.key});

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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Healthy Balanced vegetarian food',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 13),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Meal Plan',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.black),
                  ),
                  // Expanded(child: ColoredBox(color: Colors.black))
                  // Expanded(
                  //   child: GridView.count(
                  //     crossAxisSpacing: 10,
                  //     mainAxisSpacing: 10,
                  //     crossAxisCount: 2,
                  //     childAspectRatio: 1,
                  //     shrinkWrap: true,
                  //     // physics: const NeverScrollableScrollPhysics(),
                  //     padding: EdgeInsets.all(10),
                  //     children: List<Widget>.generate(6, (index) {
                  //       return InkWell(
                  //         onTap: () {},
                  //         child: LifestyleElementGridTile(
                  //           index: index,
                  //           isElementSelected: false,
                  //         ),
                  //       );
                  //     }),
                  //   ),
                  // ),
                ]),
          ),
          Expanded(
            child: GridView.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 1,
              padding: const EdgeInsets.all(20),
              children: List<Widget>.generate(6, (index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/meal_plan_detail');
                  },
                  child: LifestyleElementGridTile(
                    index: index,
                    isElementSelected: false,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class LifestyleElementGridTile extends StatefulWidget {
  final int index;
  final bool isElementSelected;
  const LifestyleElementGridTile(
      {super.key, required this.index, required this.isElementSelected});

  @override
  State<LifestyleElementGridTile> createState() =>
      _LifestyleElementGridTileState();
}

class _LifestyleElementGridTileState extends State<LifestyleElementGridTile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // Image.asset(
          //   'assets/images/ic_image_${index + 1}.png',
          //   width: 150,
          //   height: 150,
          // ),
          Container(
            alignment: Alignment.center,
            // width: 120,
            // height: 120,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFD0D0D0),
                  blurRadius: 5.0, // soften the shadow
                  spreadRadius: 1.0, //extend the shadow
                )
              ],
            ),
            child: Image.asset(
              'assets/images/ic_image_${widget.index + 1}.png',
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: widget.isElementSelected
                    ? const Color(0xff4AB7C3).withOpacity(0.7)
                    : Colors.black.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Text(
                'Element ${widget.index}',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
          Visibility(
            visible: widget.isElementSelected,
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 0, top: 0),
                child: Transform.translate(
                    offset: const Offset(7, -7),
                    child: SvgPicture.asset(
                      'assets/images/ic_green_check.svg',
                      width: 25,
                      height: 25,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
