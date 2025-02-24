import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:well_path/common/constants.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/global_keys.dart';
import 'package:well_path/corewidgets/notification_action_app_bar_button.dart';
import 'package:well_path/corewidgets/settings_action_app_bar_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/features/homescreens/trends/cubit/bp_trends_cubit.dart';
import 'package:well_path/features/homescreens/trends/models/bp_trends_state.dart';
import 'package:well_path/features/homescreens/trends/network/request/bp_category_details_request.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_bar_graph_response.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';

import '../bp_trends/bp_trends_view.dart';

// TODO: Change this page name because its the details of Category of Blood Pressure

class BPCategoryDetailPage extends StatefulWidget {
  BPCategoryDetailPage({required this.bpCategoryDetail, super.key});

  final BPTrendsBarChartListItem bpCategoryDetail;
  @override
  State<BPCategoryDetailPage> createState() => _BPCategoryDetailPageState();
}

class _BPCategoryDetailPageState extends State<BPCategoryDetailPage>
    with Loading, Message {
  late final _cubit = context.read<BPTrendsCubit>();

  void getBPCategoryDetails(TimePeriod selectedTimePeriod) {
    var now = DateTime.now().toUtc();
    String todaysDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(now);

    var now_1w = now.subtract(const Duration(days: 7)).toUtc();
    String weekAgo = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(now_1w);

    var now_1m = DateTime(now.year, now.month - 1, now.day);
    String monthAgo = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(now_1m);

    var now_1y = DateTime(now.year - 1, now.month, now.day);
    String yearAgo = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(now_1y);

    switch (selectedTimePeriod) {
      // * For Week
      case TimePeriod.week:
        _cubit.getBPCategoryDetails(BloodPressureCategoryDetailRequest(
            startDate: weekAgo,
            endDate: todaysDate,
            categoryBP: widget.bpCategoryDetail.categoryBP.index));
        break;
      // * For Month
      case TimePeriod.month:
        _cubit.getBPCategoryDetails(BloodPressureCategoryDetailRequest(
            startDate: monthAgo,
            endDate: todaysDate,
            categoryBP: widget.bpCategoryDetail.categoryBP.index));
        break;
      // * For Year
      case TimePeriod.year:
        _cubit.getBPCategoryDetails(BloodPressureCategoryDetailRequest(
            startDate: yearAgo,
            endDate: todaysDate,
            categoryBP: widget.bpCategoryDetail.categoryBP.index));
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    // _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    getBPCategoryDetails(TimePeriod.week);
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now().toUtc();
    String todaysFormattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(now);
    return BlocBuilder<BPTrendsCubit, BPTrendState>(
      builder: (context, state) {
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
          body: Stack(
            children: [
              Image.asset(
                "assets/images/bg_onboard.png",
                width: double.maxFinite,
                height: double.maxFinite,
                fit: BoxFit.cover,
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.bpCategoryDetail.categoryName,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 20),
                      TimePeriodWidget(onTimePeriodFilterPressed: (timePeriod) {
                        switch (timePeriod.index) {
                          // * For Week
                          case 0:
                            var now_1w =
                                now.subtract(const Duration(days: 7)).toUtc();
                            String weekAgoFormattedDate =
                                DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'")
                                    .format(now_1w);
                            _cubit.getBPCategoryDetails(
                                BloodPressureCategoryDetailRequest(
                                    startDate: weekAgoFormattedDate,
                                    endDate: todaysFormattedDate,
                                    categoryBP: widget
                                        .bpCategoryDetail.categoryBP.index));
                            break;
                          // * For Month
                          case 1:
                            var now_1m =
                                DateTime(now.year, now.month - 1, now.day);
                            String monthAgoFormattedDate =
                                DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'")
                                    .format(now_1m);
                            _cubit.getBPCategoryDetails(
                                BloodPressureCategoryDetailRequest(
                                    startDate: monthAgoFormattedDate,
                                    endDate: todaysFormattedDate,
                                    categoryBP: widget
                                        .bpCategoryDetail.categoryBP.index));
                            break;
                          // * For Year
                          case 2:
                            var now_1y =
                                DateTime(now.year - 1, now.month, now.day);
                            String yearAgoFormattedDate =
                                DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'")
                                    .format(now_1y);
                            _cubit.getBPCategoryDetails(
                                BloodPressureCategoryDetailRequest(
                                    startDate: yearAgoFormattedDate,
                                    endDate: todaysFormattedDate,
                                    categoryBP: widget
                                        .bpCategoryDetail.categoryBP.index));
                            break;
                        }
                      }),
                      Expanded(
                          child: ListView.builder(
                              itemCount:
                                  _cubit.state.bpCategoryDetailList.length,
                              itemBuilder: (context, index) {
                                final detail =
                                    _cubit.state.bpCategoryDetailList[index];
                                const textStyle = TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.0,
                                  color: Color(0xff4AB7C3),
                                );
                                return Card(
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/icon_calendar.svg',
                                                  width: 18,
                                                  height: 18,
                                                ),
                                              ),
                                              Text(
                                                  detail.formattedDate
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall
                                                      ?.copyWith(
                                                          fontSize: 14,
                                                          color: Colors.black)),
                                              const SizedBox(width: 15),
                                              const CircleWidget(
                                                  circleColor:
                                                      Color(0xff4AB7C3)),
                                              Text(
                                                  detail.formattedTime
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall
                                                      ?.copyWith(
                                                          fontSize: 14,
                                                          color: Colors.black)),
                                            ],
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Systolic BP',
                                                      style: textStyle,
                                                    ),
                                                    Text(detail.systolicBP
                                                        .toString())
                                                  ],
                                                ),
                                                const VerticalDivider(
                                                  width: 6,
                                                  thickness: 1,
                                                  indent: 0,
                                                  endIndent: 0,
                                                  color: Color(0xffD0D0D0),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Diastolic BP',
                                                      style: textStyle,
                                                    ),
                                                    Text(detail.diastolicBP
                                                        .toString())
                                                  ],
                                                ),
                                                const VerticalDivider(
                                                  width: 6,
                                                  thickness: 1,
                                                  indent: 0,
                                                  endIndent: 0,
                                                  color: Color(0xffD0D0D0),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Pulse',
                                                      style: textStyle,
                                                    ),
                                                    Text(
                                                        detail.pulse.toString())
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })),
                    ],
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
