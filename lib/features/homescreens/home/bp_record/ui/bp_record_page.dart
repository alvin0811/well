import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:well_path/colors/colors.dart';
import 'package:well_path/common/constants.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';
import 'package:well_path/features/homescreens/home/bp_record/cubit/add_new_entry_cubit.dart';
import 'package:well_path/features/homescreens/home/bp_record/cubit/bp_record_cubit.dart';
import 'package:well_path/features/homescreens/home/bp_record/models/add_new_entry_dialog.dart';
import 'package:well_path/features/homescreens/home/bp_record/models/alert_bp_model.dart';
import 'package:well_path/features/homescreens/home/bp_record/models/bp_record_paginator.dart';
import 'package:well_path/features/homescreens/home/bp_record/models/bp_record_state.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/request/bp_request.dart';
import 'package:well_path/features/homescreens/home/cubit/home_cubit.dart';
import 'package:well_path/features/homescreens/trends/network/request/bp_trends_line_graph_request.dart';
import 'package:well_path/features/homescreens/trends/ui/Charts/charts_view/line_chart.dart';
import 'package:well_path/features/homescreens/trends/ui/bp_trends/bp_trends_view.dart';
import 'package:well_path/features/homescreens/trends/ui/bp_trends/chart_container.dart';
import 'package:well_path/features/settings/health_facts/view/bullet_Items.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';

class BPRecordPage extends StatefulWidget {
  const BPRecordPage({Key? key}) : super(key: key);

  @override
  State<BPRecordPage> createState() => _BPRecordPageState();
}

class _BPRecordPageState extends State<BPRecordPage> with Loading, Message {
  late final _cubit = context.read<BpRecordCubit>();
  late final _cubitHome = context.read<HomeCubit>();
  final scrollController = ScrollController();
  int pageNumber = 1;

  @override
  void initState() {
    super.initState();
    _cubit.getSelectedItemIds();
    scrollController.addListener(_scrollListener);
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    _cubitHome.getUserFromAuthStore();
    _cubit.getBpRecordList(BpRecordPaginator(offset: pageNumber, limit: 10));
    getChartsData();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      _cubit.isLoading(true);
      setState(() {
        pageNumber++;
      });
      _cubit
          .getBpRecordListTwo(BpRecordPaginator(offset: pageNumber, limit: 10));
    }
  }

  void _openHyperTensionDialog(BpRecordCubit cubit, HomeCubit _cubitHome,
      AlertBPContent alertBPContent) async {
    var isShow = await showDialog<int>(
        context: context,
        builder: (context) {
          return HypertensionAlertDialog(alertBPContent: alertBPContent);
        });
    if (isShow == 1) {
      cubit.updateDialogvalue(false);
      _cubitHome.updateTabs(1);
    }
  }

  FilterByTime selectedTimeFilter = FilterByTime.pm;
  TimePeriod selectedTimePeriod = TimePeriod.week;

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
        _cubit.updateisShowDialogAlertBp();
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
        _cubit.updateisShowDialogAlertBp();
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
        _cubit.updateisShowDialogAlertBp();
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BpRecordCubit, BpRecordState>(
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (state.isShowDialogAlertBp) {
            if (state.alertBPContent.categoryBp == 2 ||
                state.alertBPContent.categoryBp == 3) {
                  _cubit.showLoader();
              Future.delayed(const Duration(milliseconds: 5000), () {
                getChartsData();
                _cubit.hideLoader();
              });
            } else {
              _openHyperTensionDialog(_cubit, _cubitHome, state.alertBPContent);
            }
          }
        });
        return Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [AddEntryButton()],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "  Health Facts",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 3, right: 3, top: 10, bottom: 5),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                dividerColor: Colors.transparent,
                                iconTheme: const IconThemeData(
                                    color: Color(0xFF4AB7C3))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 13),
                                  child: Text(
                                    state.dailyFact?.dailyFactName ??
                                        ".....", //here key of map which is question will be printed...
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: const Color(0xFF4AB7C3)),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 13),
                                //   child: Row(children: [
                                //     Text(
                                //       state.dailyFact?.questionaire.questionaire
                                //               .keys
                                //               .elementAt(state.questionareInnerIndex ?? 0) ??
                                //           ".....", //here key of map which is question will be printed...
                                //       style: Theme.of(context)
                                //           .textTheme
                                //           .bodyMedium
                                //           ?.copyWith(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 16,
                                //             color: Colors.black,
                                //           ),
                                //     ),
                                //   ]),
                                // ),
                                const SizedBox(
                                  height: 5,
                                ),
                                if (state.dailyFact != null)
                                  BulletItems(
                                      color: Colors.black,
                                      bulletPoint: state.dailyFact!.questionaire
                                              .questionaire[
                                          state.dailyFact!.questionaire
                                              .questionaire.keys
                                              .elementAt(
                                                  state.questionareInnerIndex ??
                                                      0)]![state
                                              .questionareAnswerInnerIndex ??
                                          0])
                                // for (var i = 0; i < 1; i++)
                                //   BulletItems(
                                //       bulletPoint: state.dailyFact!
                                //               .questionaire.questionaire[
                                //           state.dailyFact!.questionaire
                                //               .questionaire.keys
                                //               .elementAt(index)]![i])
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "  Blood Pressure Trends",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                HeaderWidget(
                  onFilterByPressed: (selectedFilter) {
                    selectedTimeFilter = selectedFilter;
                    getChartsData();
                  },
                ),
                const SizedBox(height: 20),
                TimePeriodWidget(onTimePeriodFilterPressed: (timePeriod) {
                  selectedTimePeriod = timePeriod;
                  getChartsData();
                }),
                ChartContainer(
                  title: 'Line Chart',
                  color: Colors.transparent,
                  chart: LineChartContent(
                    bpTrendsData: state.bloodPressureList,
                    selectedTimePeriod: selectedTimePeriod,
                    filteredData: selectedTimePeriod == TimePeriod.year
                        ? _cubit.filteredYearData
                        : _cubit.filteredData,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AddEntryButton extends StatefulWidget {
  const AddEntryButton({super.key});

  @override
  State<AddEntryButton> createState() => _AddEntryButtonState();
}

class _AddEntryButtonState extends State<AddEntryButton> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BpRecordCubit>();
    return ElevatedButton.icon(
      onPressed: () async {
        var bpRecords = await showDialog<BpRecordValues>(
          context: context,
          builder: (context) {
            return BlocProvider(
              create: (context) => AddNewEntryCubit(),
              child: const AddNewEntryDialog(),
            );
          },
        );
        BpRequest bpRequest = BpRequest(
            systolicBP: int.parse(bpRecords!.systolic),
            diastolicBP: int.parse(bpRecords.diAstolic),
            pulse: int.parse(bpRecords.pulse));
        cubit.save(bpRequest);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4AB7C3), // Color code in hex: 4AB7C3
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
      icon: const Icon(
        Icons.add,
        color: Colors.white,
        size: 13,
      ),
      label: Text(
        'Add New Entry',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class AddNewEntryDialog extends StatefulWidget {
  const AddNewEntryDialog({Key? key}) : super(key: key);

  @override
  State<AddNewEntryDialog> createState() => _AddNewEntryDialogState();
}

class _AddNewEntryDialogState extends State<AddNewEntryDialog> {
  final TextEditingController _systolicController = TextEditingController();
  final TextEditingController _diastolicController = TextEditingController();
  final TextEditingController _pulse = TextEditingController();
  late final cubit = context.read<AddNewEntryCubit>();

  @override
  void initState() {
    super.initState();
    _systolicController.text = "";
    _diastolicController.text = "";
    _pulse.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: BlocBuilder<AddNewEntryCubit, AddNewEntryRecordState>(
        builder: (context, state) {
          return SizedBox(
            height: 450,
            width: 335,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Add New Bp",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Systolic BP",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF4AB7C3), fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  WellPathSecondTextField(
                    textEditingController: _systolicController,
                    horizontalPadding: 0,
                    hintText: '',
                    prefixIcon: null,
                    suffixIcon: null,
                    obscureText: false,
                    onChanged: cubit.onSystolicChanged,
                    error: state.isSystolicCorrect
                        ? ""
                        : "Value should be in between 0 - 300*",
                  ),
                  Text(
                    "Diastolic BP",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF4AB7C3), fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  WellPathSecondTextField(
                    textEditingController: _diastolicController,
                    horizontalPadding: 0,
                    hintText: '',
                    prefixIcon: null,
                    suffixIcon: null,
                    obscureText: false,
                    onChanged: cubit.onDiAstolicChanged,
                    error: state.isDiAstolicCorrect
                        ? ""
                        : "Value should be in between 0 - 200*",
                  ),
                  Text(
                    "Pulse",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF4AB7C3), fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  WellPathSecondTextField(
                    textEditingController: _pulse,
                    horizontalPadding: 0,
                    hintText: '',
                    prefixIcon: null,
                    suffixIcon: null,
                    obscureText: false,
                    onChanged: cubit.onPulse,
                    error: state.isPulseCorrect
                        ? ""
                        : "Value should be in between 0 - 200*",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  WellPathButton(
                    buttonText: 'Save',
                    onPressed: state.enableNext
                        ? () {
                            BpRecordValues bpRecordValues = BpRecordValues(
                                systolic: _systolicController.text,
                                diAstolic: _diastolicController.text,
                                pulse: _pulse.text);
                            Navigator.pop(context, bpRecordValues);
                          }
                        : null,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HypertensionAlertDialog extends StatefulWidget {
  final AlertBPContent alertBPContent;
  const HypertensionAlertDialog({required this.alertBPContent, Key? key})
      : super(key: key);

  @override
  State<HypertensionAlertDialog> createState() =>
      _HypertensionAlertDialogState();
}

class _HypertensionAlertDialogState extends State<HypertensionAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 10),
        elevation: 0,
        backgroundColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 30,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                const SizedBox(
                  width: 183,
                  height: 183,
                  child: CircularProgressIndicator(
                    strokeWidth: 14,
                    color: Color(0xFF4AB7C3),
                    value:
                        1, // Convert progress value to a value between 0 and 1
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${widget.alertBPContent.systolic}/${widget.alertBPContent.diAstolic}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "mmhg",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 16, color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(int.parse(
                    getColorCode(widget.alertBPContent.categoryBp)!
                        .backGroundColor)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                widget.alertBPContent.type,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Color(int.parse(
                        getColorCode(widget.alertBPContent.categoryBp)!
                            .textColor)),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.alertBPContent.categoryBp != 1 ? "ALERT!" : "",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.red, fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.alertBPContent.heading,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.alertBPContent.description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: WellPathButton(
                  onPressed: () {
                    //  _cubitHome.updateTabs(1);
                    Navigator.pop(context, 1);
                  },
                  buttonText: "View BP Trend"),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}

class WellPathSecondTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Widget? prefixIcon, suffixIcon;
  double? horizontalPadding;
  final String? error;
  final TextEditingController? textEditingController;

  final void Function(String)? onChanged;

  WellPathSecondTextField(
      {required this.hintText,
      required this.textEditingController,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.onChanged,
      required this.obscureText,
      required this.error,
      Key? key,
      this.horizontalPadding = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: horizontalPadding!),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFD0D0D0),
                blurRadius: 5.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  0.5, // Move to right 5  horizontally
                  0.5, // Move to bottom 5 Vertically
                ),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: textEditingController,
                obscureText: obscureText,
                onChanged: onChanged,
                autocorrect: false,
                enableSuggestions: false,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 12.0, color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 12.0, color: Colors.black),
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
              ),
            ],
          ),
        ),
        const SizedBox.square(dimension: 4.0),
        error != null
            ? Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Text(
                  error.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 9.0,
                        color: Colors.red,
                      ),
                ),
              )
            : const SizedBox.square(dimension: 0.0),
      ],
    );
  }
}

class BpRecordValues {
  final String systolic;
  final String diAstolic;
  final String pulse;

  BpRecordValues(
      {required this.systolic, required this.diAstolic, required this.pulse});
}

class HeaderWidget extends StatefulWidget {
  HeaderWidget({super.key, required this.onFilterByPressed});

  final Function(FilterByTime) onFilterByPressed;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  FilterByTime filterBy = FilterByTime.pm;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Text(
        //   "Bp Trends",
        //   style: Theme.of(context).textTheme.titleLarge,
        // ),
        PopupMenuButton(
          offset: Offset(0, filterBy == FilterByTime.am ? 20 : 70),
          position: PopupMenuPosition.under,
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
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<FilterByTime>>[
            const PopupMenuItem<FilterByTime>(
                value: FilterByTime.am, child: Text('AM Readings')),
            const PopupMenuItem<FilterByTime>(
                value: FilterByTime.pm, child: Text('PM Readings')),
          ],
        ),
      ],
    );
  }
}
