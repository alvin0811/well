import 'dart:convert';
import 'dart:typed_data';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';
import 'package:well_path/common/constants.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/homescreens/trends/network/request/bp_export_graph_request.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_bar_graph_response.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_line_graph_domain_model.dart';
import 'package:well_path/widgets/export_csv_report_confirmation_dialog.dart';

import '../../../../../colors/colors.dart';
import '../../../../../corewidgets/app_bar_back_button.dart';
import '../../../../../corewidgets/global_keys.dart';
import '../../../../../corewidgets/notification_action_app_bar_button.dart';
import '../../../../../corewidgets/settings_action_app_bar_button.dart';
import '../../../../../corewidgets/well_path_app_bar.dart';
import '../../../../../helper/mixins/loading_mixin.dart';
import '../../../../../helper/mixins/show_message_mixin.dart';
import '../../../home/bp_record/models/bp_record_paginator.dart';
import '../../../home/cubit/home_cubit.dart';
import '../../cubit/bp_trends_cubit.dart';
import '../../models/bp_trends_state.dart';
import '../../network/request/bp_trends_line_graph_request.dart';
import '../Charts/charts_view/bar_chart.dart';
import '../Charts/charts_view/line_chart.dart';
import 'chart_container.dart';

enum TimePeriod {
  week,
  month,
  year,
}

// This is the type used by the popup menu below.
enum FilterByTime {
  pm,
  am,
}

extension TimePeriodExtension on TimePeriod {
  String get name {
    switch (this) {
      case TimePeriod.week:
        return 'Week';
      case TimePeriod.month:
        return 'Month';
      case TimePeriod.year:
        return 'Year';
      default:
        return '';
    }
  }
}

class BpTrendsPage extends StatefulWidget {
  const BpTrendsPage({super.key});

  @override
  State<BpTrendsPage> createState() => _BpTrendsPageState();
}

class _BpTrendsPageState extends State<BpTrendsPage> with Loading, Message {
  late final _homeCubit = context.read<HomeCubit>();
  late final _cubit = context.read<BPTrendsCubit>();

  FilterByTime selectedTimeFilter = FilterByTime.pm;
  TimePeriod selectedTimePeriod = TimePeriod.week;

  ScreenshotController screenshotController = ScreenshotController();

  void getChartsData() {
    var now = DateTime.now().toUtc();

    var localDateNow = DateTime.now();
    DateTime amStartlocalDate = DateTime(
        localDateNow.year, localDateNow.month, localDateNow.day, 0, 0, 0);
    DateTime amEndlocalDate = DateTime(
        localDateNow.year, localDateNow.month, localDateNow.day, 11, 59, 59);

    DateTime pmStartlocalDate = DateTime(
        localDateNow.year, localDateNow.month, localDateNow.day, 12, 0, 0);
    DateTime pmEndlocalDate = DateTime(
        localDateNow.year, localDateNow.month, localDateNow.day, 23, 59, 59);

    String amStartLocalFormattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(amStartlocalDate.toUtc());

    String amEndLocalFormattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(amEndlocalDate.toUtc());

    String pmStartLocalFormattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(pmStartlocalDate.toUtc());

    String pmEndLocalFormattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(pmEndlocalDate.toUtc());

    String todaysFormattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(now);

    var now_1w = now.subtract(const Duration(days: 7)).toUtc();
    String weekAgoFormattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(now_1w);

    var now_1m = DateTime(now.year, now.month - 1, now.day).toUtc();
    String monthAgoFormattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(now_1m);

    var now_1y = DateTime(now.year - 1, now.month, now.day).toUtc();
    String yearAgoFormattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(now_1y);

    switch (selectedTimePeriod) {
      // * For Week
      case TimePeriod.week:
        _cubit.getBPGraphData(BloodPressureTrendsLineGraphRequest(
            timeFilter: selectedTimeFilter == FilterByTime.pm ? 2 : 1,
            startDate: weekAgoFormattedDate,
            endDate: todaysFormattedDate,
            amEndTime: amEndLocalFormattedDate,
            amStartTime: amStartLocalFormattedDate,
            pmEndTime: pmEndLocalFormattedDate,
            pmStartTime: pmStartLocalFormattedDate));
        break;
      // * For Month
      case TimePeriod.month:
        _cubit.getBPGraphData(BloodPressureTrendsLineGraphRequest(
            timeFilter: selectedTimeFilter == FilterByTime.pm ? 2 : 1,
            startDate: monthAgoFormattedDate,
            endDate: todaysFormattedDate,
            amEndTime: amEndLocalFormattedDate,
            amStartTime: amStartLocalFormattedDate,
            pmEndTime: pmEndLocalFormattedDate,
            pmStartTime: pmStartLocalFormattedDate));
        break;
      // * For Year
      case TimePeriod.year:
        _cubit.getBPGraphData(BloodPressureTrendsLineGraphRequest(
            timeFilter: selectedTimeFilter == FilterByTime.pm ? 2 : 1,
            startDate: yearAgoFormattedDate,
            endDate: todaysFormattedDate,
            amEndTime: amEndLocalFormattedDate,
            amStartTime: amStartLocalFormattedDate,
            pmEndTime: pmEndLocalFormattedDate,
            pmStartTime: pmStartLocalFormattedDate));
        break;
    }
  }

  void _captureScreenshot(BuildContext context) async {
    screenshotController.capture().then((Uint8List? image) async {
      if (image.isNotNull) {
        var imageInBase64 = await showDialog<String>(
          context: context,
          builder: (BuildContext context) {
            return CapturedScreenshotDialog(image: image!);
          },
        );
        if (imageInBase64.isNotNull) {
          _cubit.downloadCSVReport(BloodPressureExportGraphRequest(
              image: imageInBase64.toString(),
              timeFilter: selectedTimeFilter == FilterByTime.pm ? 2 : 1));
        }
      }
    }).catchError((onError) {
      _cubit.imageException(onError);
    });
  }

  @override
  void initState() {
    super.initState();
    // _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);

    var now = DateTime.now();

    var localDateNow = DateTime.now();
    DateTime amStartlocalDate = DateTime(
        localDateNow.year, localDateNow.month, localDateNow.day, 0, 0, 0);
    DateTime amEndlocalDate = DateTime(
        localDateNow.year, localDateNow.month, localDateNow.day, 11, 59, 59);

    DateTime pmStartlocalDate = DateTime(
        localDateNow.year, localDateNow.month, localDateNow.day, 12, 0, 0);
    DateTime pmEndlocalDate = DateTime(
        localDateNow.year, localDateNow.month, localDateNow.day, 23, 59, 59);

    String amStartLocalFormattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(amStartlocalDate.toUtc());

    String amEndLocalFormattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(amEndlocalDate.toUtc());

    String pmStartLocalFormattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(pmStartlocalDate.toUtc());

    String pmEndLocalFormattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(pmEndlocalDate.toUtc());

    var now_1w = now.subtract(const Duration(days: 7));
    String todaysFormattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(now);
    String weekAgoFormattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(now_1w);
    _cubit.getBPGraphData(BloodPressureTrendsLineGraphRequest(
        timeFilter: selectedTimeFilter == FilterByTime.pm ? 2 : 1,
        startDate: weekAgoFormattedDate,
        endDate: todaysFormattedDate,
        amEndTime: amEndLocalFormattedDate,
        amStartTime: amStartLocalFormattedDate,
        pmEndTime: pmEndLocalFormattedDate,
        pmStartTime: pmStartLocalFormattedDate));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BPTrendsCubit, BPTrendState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: WellPathAppBar(
            leading: AppBarBackButton(
              onBackPressed: () {
                _homeCubit.updateTabs(0);
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Blood Pressure Trends",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      HeaderWidget(
                        onFilterByPressed: (selectedFilter) {
                          selectedTimeFilter = selectedFilter;
                          getChartsData();
                        },
                        onExportPressed: () {
                          _captureScreenshot(context);

                          // Todo: Call Export CSV data API here!.....
                          // showConfirmationDialog(
                          //   context,
                          //   title: "Are you sure you want to export your data?",
                          //   primaryButtonText: "Yes",
                          //   secondaryButtonText: "No",
                          //   onPrimaryPressed: () async {
                          //     _cubit.downloadCSVReport(image);
                          //   },
                          // );
                        },
                      ),
                      const SizedBox(height: 10),
                      ChartsWidget(
                        onTimePeriodFilterPressed: (timePeriod) {
                          selectedTimePeriod = timePeriod;
                          getChartsData();
                        },
                        selectedTime: selectedTimePeriod,
                        bpTrendsBarChartData: state.bpTrendsBarChartListItem,
                        bpTrendsData: state.bloodPressureList,
                        filteredData: selectedTimePeriod == TimePeriod.year
                            ? _cubit.filteredYearData
                            : _cubit.filteredData,
                        screenshotController: screenshotController,
                      ),
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

class ChartsWidget extends StatefulWidget {
  const ChartsWidget(
      {super.key,
      required this.bpTrendsData,
      required this.onTimePeriodFilterPressed,
      required this.bpTrendsBarChartData,
      required this.filteredData,
      required this.selectedTime,
      required this.screenshotController});
  final List<BPTrendLineGraphUiModel> bpTrendsData;
  final Function(TimePeriod) onTimePeriodFilterPressed;
  final List<BPTrendsBarChartListItem> bpTrendsBarChartData;
  final Map<DateTime, List<BPTrendLineGraphUiModel>> filteredData;
  final ScreenshotController screenshotController;

  final TimePeriod selectedTime;

  @override
  State<ChartsWidget> createState() => _ChartsWidgetState();
}

class ColorCode {
  final String textColor;
  final String backGroundColor;

  ColorCode({required this.textColor, required this.backGroundColor});
}

class _ChartsWidgetState extends State<ChartsWidget> {
  late final _cubit = context.read<BPTrendsCubit>();
  final scrollController = ScrollController();
  int pageNumber = 1;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    _cubit.getBpRecordList(BpRecordPaginator(offset: pageNumber, limit: 10));
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      debugPrint("debug print trigger");
      _cubit.isLoading(true);
      setState(() {
        pageNumber++;
      });
      _cubit
          .getBpRecordListTwo(BpRecordPaginator(offset: pageNumber, limit: 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            TimePeriodWidget(onTimePeriodFilterPressed: (timePeriod) {
              widget.onTimePeriodFilterPressed(timePeriod);
            }),
            Screenshot(
              controller: widget.screenshotController,
              child: Column(
                children: [
                  ChartContainer(
                    title: 'Line Chart',
                    color: Colors.transparent,
                    chart: LineChartContent(
                        bpTrendsData: widget.bpTrendsData,
                        selectedTimePeriod: widget.selectedTime,
                        filteredData: widget.filteredData),
                  ),
                  Center(
                    child: Column(children: [
                      const SizedBox(height: 15),
                      const SystolicDiastolicWidget(),
                      const SizedBox(height: 15),
                      Text('Activity',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black)),
                      const SizedBox(height: 15),
                    ]),
                  ),
                  ChartContainer(
                      title: 'Bar Chart',
                      color: Colors.transparent,
                      chart: BarChartContent(
                          bpTrendsBarChartData: widget.bpTrendsBarChartData)),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Blood Pressure Records",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: _cubit.state.bpResponseList.length + 1,
              itemBuilder: (context, index) {
                if (index == _cubit.state.bpResponseList.length) {
                  if (_cubit.state.isLoading) {
                    return const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          )
                        ]);
                  } else {
                    return Container(); // Empty
                  }
                } else {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 7.0,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/ic_calender.svg"),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                _cubit.getDate(_cubit
                                    .state.bpResponseList[index].createdAt),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: Colors.black, fontSize: 12),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset("assets/images/ic_clock.svg"),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                _cubit.getTime(_cubit
                                    .state.bpResponseList[index].createdAt),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: Colors.black, fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _cubit.openBox(index);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(int.parse(getColorCode(
                                      _cubit.state.bpResponseList[index]
                                          .categoryBP)!
                                  .backGroundColor)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Text(
                              _cubit.state.bpResponseList[index].type,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Color(int.parse(getColorCode(_cubit
                                              .state
                                              .bpResponseList[index]
                                              .categoryBP)!
                                          .textColor)),
                                      fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AnimatedOpacity(
                            opacity:
                                _cubit.state.bpResponseList[index].isVisible
                                    ? 1.0
                                    : 0.0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            child: Visibility(
                              visible:
                                  _cubit.state.bpResponseList[index].isVisible,
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Systolic BP",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color:
                                                      const Color(0xFF4AB7C3),
                                                  fontSize: 12),
                                        ),
                                        Text(
                                          _cubit.state.bpResponseList[index]
                                              .systolicBP
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    const VerticalDivider(color: Colors.red),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Diastolic BP",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color:
                                                      const Color(0xFF4AB7C3),
                                                  fontSize: 12),
                                        ),
                                        Text(
                                          _cubit.state.bpResponseList[index]
                                              .diastolicBP
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    const VerticalDivider(color: Colors.red),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Pulse",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color:
                                                      const Color(0xFF4AB7C3),
                                                  fontSize: 12),
                                        ),
                                        Text(
                                          _cubit
                                              .state.bpResponseList[index].pulse
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SystolicDiastolicWidget extends StatelessWidget {
  const SystolicDiastolicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleWidget(circleColor: Color(0xff235564)),
        Text('Systolic',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontSize: 14, color: Colors.black)),
        const SizedBox(width: 30),
        const CircleWidget(circleColor: Color(0xff4AB7C3)),
        Text('Diastolic',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontSize: 14, color: Colors.black)),
      ],
    );
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    super.key,
    required this.circleColor,
  });

  final Color circleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        width: 10.0,
        height: 10.0,
        decoration: BoxDecoration(
          color: circleColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class HeaderWidget extends StatefulWidget {
  HeaderWidget(
      {super.key,
      required this.onFilterByPressed,
      required this.onExportPressed});

  final Function(FilterByTime) onFilterByPressed;
  final Function() onExportPressed;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  FilterByTime filterBy = FilterByTime.pm;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ExportButtonWidget(widget: widget),
            PopupMenuButton(
              offset: Offset(0, filterBy == FilterByTime.am ? 60 : 100),
              position: PopupMenuPosition.over,
              initialValue: filterBy,
              onSelected: (item) {
                setState(() {
                  filterBy = item;
                });
                widget.onFilterByPressed(item);
              },
              child: Container(
                alignment: Alignment.center,
                width: 110,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: appPrimaryBlueColor),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text(
                  "Filter By",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<FilterByTime>>[
                const PopupMenuItem<FilterByTime>(
                    value: FilterByTime.am, child: Text('AM Readings')),
                const PopupMenuItem<FilterByTime>(
                    value: FilterByTime.pm, child: Text('PM Readings')),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class ExportButtonWidget extends StatelessWidget {
  const ExportButtonWidget({
    super.key,
    required this.widget,
  });

  final HeaderWidget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            backgroundColor: appPrimaryBlueColor,
            elevation: 2),
        onPressed: widget.onExportPressed,
        child: Text(
          'Export',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class TimePeriodWidget extends StatefulWidget {
  const TimePeriodWidget({super.key, required this.onTimePeriodFilterPressed});
  final Function(TimePeriod) onTimePeriodFilterPressed;

  @override
  State<TimePeriodWidget> createState() => _TimePeriodWidgetState();
}

class _TimePeriodWidgetState extends State<TimePeriodWidget> {
  TimePeriod selectedTimePeriod = TimePeriod.week;

  void _onTimePeriodSelected(TimePeriod timePeriod) {
    setState(() {
      selectedTimePeriod = timePeriod;
    });
  }

  Widget _buildButton(TimePeriod timePeriod) {
    final isSelected = timePeriod == selectedTimePeriod;
    return SizedBox(
      width: 80,
      height: 35,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            backgroundColor:
                isSelected ? appPrimaryColor : const Color(0xFFF3F3F3),
            elevation: 0.4),
        onPressed: () {
          widget.onTimePeriodFilterPressed(timePeriod);
          _onTimePeriodSelected(timePeriod);
        },
        child: Text(
          timePeriod.name,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: TimePeriod.values.map((timePeriod) {
          return _buildButton(timePeriod);
        }).toList(),
      ),
    );
  }
}

class CapturedScreenshotDialog extends StatelessWidget {
  final Uint8List image;

  CapturedScreenshotDialog({required this.image});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.memory(image),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: appPrimaryBlueColor,
                        elevation: 0.4),
                    onPressed: () {
                      Navigator.pop(context, base64Encode(image));
                    },
                    child: Text(
                      'Upload',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: appPrimaryColor,
                        elevation: 0.4),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Close',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
