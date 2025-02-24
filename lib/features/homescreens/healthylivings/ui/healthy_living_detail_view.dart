import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:well_path/common/constants.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/global_keys.dart';
import 'package:well_path/corewidgets/notification_action_app_bar_button.dart';
import 'package:well_path/corewidgets/settings_action_app_bar_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';
import 'package:well_path/features/homescreens/healthylivings/cubit/healthy_living_details_cubit.dart';
import 'package:well_path/features/homescreens/healthylivings/models/healthy_living_details_state.dart';
import 'package:well_path/features/homescreens/healthylivings/models/healthy_living_model.dart';
import 'package:well_path/features/settings/health_facts/view/bullet_Items.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class HealthyLivingDetailsPage extends StatefulWidget {
  // final String healthyLivingContent;
  // final String healthyLivingHeading;
  final HealthyLivingContent detail;
  const HealthyLivingDetailsPage({required this.detail, super.key});
  @override
  State<HealthyLivingDetailsPage> createState() =>
      _HealthyLivingDetailsPageState();
}

class _HealthyLivingDetailsPageState extends State<HealthyLivingDetailsPage>
    with Loading, Message {
  late final _cubit = context.read<HealthyLivingDetailsCubit>();
  @override
  void initState() {
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    _cubit.showAndHideLoader();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HealthyLivingDetailsCubit, HealthyLivingDetailState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: WellPathAppBar(
            leading: AppBarBackButton(
              onBackPressed: () {
                Navigator.of(context).pop();
              },
              isShowWhiteIcon: true,
            ),
            actions: [
              NotificationActionButton(onNotificationPressed: () {
                navigateToNotification();
              }),
              SettingsActionButton(
                onSettingPressed: () {
                  navigatorKey.currentState?.pushNamed('/settings');
                },
                isShowWhiteIcon: true,
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                filterQuality: FilterQuality.none,
                widget.detail.bannerImagePath,
                fit: BoxFit.fill,
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.30,
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
                            " ${widget.detail.name}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                          ),
                          const SizedBox(height: 10),
                          // Expanded(
                          //   child: Linkify(
                          //       text: widget.detail.content,
                          //       onOpen: (link) =>
                          //           _launchUrl(Uri.parse(link.url))),
                          // ),
                          // Text(
                          //   widget.detail.content,
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodyMedium
                          //       ?.copyWith(color: const Color(0xff252525)),
                          //   textAlign: TextAlign.start,
                          // ),
                          HealthFactBulletItems(bulletPoint: widget.detail.content),
                          const SizedBox(height: 30),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
