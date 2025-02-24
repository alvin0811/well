import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_path/common/constants.dart';
import 'package:well_path/common/expended_scroll_view.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/global_keys.dart';
import 'package:well_path/corewidgets/notification_action_app_bar_button.dart';
import 'package:well_path/corewidgets/settings_action_app_bar_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/features/homescreens/healthylivings/models/healthy_living_model.dart';
import 'package:well_path/features/homescreens/home/cubit/home_cubit.dart';

class HealthyLivingPage extends StatefulWidget {
  const HealthyLivingPage({super.key});

  @override
  State<HealthyLivingPage> createState() => _HealthyLivingPageState();
}

class _HealthyLivingPageState extends State<HealthyLivingPage> {
  late final _cubit = context.read<HomeCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WellPathAppBar(
        leading: AppBarBackButton(
          onBackPressed: () {
            _cubit.updateTabs(0);
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
          SafeArea(
            child: ExpandedScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Healthy Living',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 15),
                  Image.asset(
                    'assets/images/ic_dash_diet_dummy.png',
                    width: MediaQuery.of(context).size.width,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Healthful living starts with you. Learn more below.',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        children: [
                          for (var i = 0; i < healthyLiving.length; i++)
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/detail',
                                    arguments:
                                        healthyLiving[i].healthyLivingContent);
                              },
                              child:  LifestyleElementGridTile(
                                image: healthyLiving[i]
                                    .healthyLivingContent
                                    .imagePath,
                                name:
                                    healthyLiving[i].healthyLivingContent.name,
                                index: i,
                                isElementSelected: false,
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LifestyleElementGridTile extends StatefulWidget {
  final int index;
  final String name;
  final String image;
  final bool isElementSelected;
  const LifestyleElementGridTile(
      {super.key,
      required this.name,
      required this.index,
      required this.image,
      required this.isElementSelected});

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
          Container(
            // alignment: Alignment.center,
            // decoration: const BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(20)),
            //   color: Colors.transparent,
            //   boxShadow: [
            //     BoxShadow(
            //       color: Color.fromARGB(255, 31, 0, 118),
            //       blurRadius: 5.0, // soften the shadow
            //       spreadRadius: 1.0, //extend the shadow
            //     )
            //   ],
            // ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              height: 45,
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
                widget.name,
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
