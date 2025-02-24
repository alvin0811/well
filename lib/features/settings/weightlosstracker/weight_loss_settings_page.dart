import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_path/common/constants.dart';

import '../../../corewidgets/app_bar_back_button.dart';
import '../../../corewidgets/weight_loss_tracker_widgets/bmi_result_widget.dart';
import '../../../corewidgets/weight_loss_tracker_widgets/gauge_widget.dart';
import '../../../corewidgets/weight_loss_tracker_widgets/weight_indicators_widget.dart';
import '../../../corewidgets/well_path_app_bar.dart';
import '../../../data/local/auth_store.dart';
import '../../../helper/logger/logger.dart';
import '../../../helper/mixins/loading_mixin.dart';
import '../../../helper/mixins/show_message_mixin.dart';
import '../../homescreens/home/cubit/home_cubit.dart';
import 'cubit/weight_loss_cubit.dart';
import 'models/weight_loss_settings_state.dart';

class WeightLossSettingPage extends StatefulWidget {
  static const route = '/weight-loss-setting-page';
  const WeightLossSettingPage({super.key});

  @override
  State<WeightLossSettingPage> createState() => WeightLossSettingPageState();
}

class WeightLossSettingPageState extends State<WeightLossSettingPage>
    with Loading, Message {
  late final _cubit = context.read<WeightLossSettingCubit>();
  late final _cubitNavigation = context.read<HomeCubit>();
  late final authStore = AuthStore();
  bool? isFromSetting = false;
  @override
  void initState() {
    super.initState();
    //  _checkIsComingFromSettings();

    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    _cubit.getBmiCalculation();
  }

  void _checkIsComingFromSettings() async {
    isFromSetting = await authStore.getIsComingFromSettings();
    Logger.e(isFromSetting.toString());
  }

   Future<void> _refresh() async {
    // Simulate an asynchronous refresh operation
    _cubit.getBmiCalculation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeightLossSettingCubit, WeightLossSettingState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: WellPathAppBar(
            leading: AppBarBackButton(
              onBackPressed: () {
                _cubitNavigation.updateTabs(0);
                //Navigator.of(context).pop();
              },
            ),
          ),
          body: Stack(
            children: [
              SafeArea(
                child: RefreshIndicator(
                   onRefresh: _refresh,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          "Weight Loss Tracker",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox.square(dimension: 20),
                        const WeightIndicatorsWidget(),
                        const SizedBox.square(dimension: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "Weight",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: const Color(0xFF4AB7C3)),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "BMI",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: const Color(0xFF4AB7C3)),
                              ),
                            )
                          ],
                        ),
                        const SizedBox.square(dimension: 20),
                        Stack(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                GaugeWidget(
                                  valueBmi: state.bmi,
                                  valueWeight: state.valueWeight,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${state.valueWeight} lbs",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium
                                                  ?.copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Row(
                                              children: [
                                                RotatedBox(
                                                  quarterTurns: state.weightGain
                                                          .toString()
                                                          .contains("-")
                                                      ? 0
                                                      : 2, //0 down 2 up
                                                  child: SvgPicture.asset(
                                                    "assets/images/ic_dropdownarrow.svg",
                                                    width: 6,
                                                    height: 6,
                                                  ),
                                                ),
                                                Text(
                                                    " ${state.weightGain.toString().replaceAll("-", "")}",
                                                    style: const TextStyle(
                                                        height: 1.2,
                                                        fontSize: 10)),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${state.bmi} kg/m2",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium
                                                  ?.copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Row(
                                              children: [
                                                RotatedBox(
                                                  quarterTurns: state.bmiGain
                                                          .toString()
                                                          .contains("-")
                                                      ? 0
                                                      : 2, //0 down 2 up
                                                  child: SvgPicture.asset(
                                                    "assets/images/ic_dropdownarrow.svg",
                                                    width: 6,
                                                    height: 6,
                                                  ),
                                                ),
                                                 Text(double.parse(state.bmiGain.toStringAsFixed(2)).toString().replaceAll("-", ""),
                                                    style: const TextStyle(
                                                        height: 1.2,
                                                        fontSize: 10)),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 90),
                              child: Row(
                                children: [
                                  BMIResultWidget(
                                    idealWeight: kgToLb(state.idealWeight.toDouble()).toString(),
                                    weeklyGoalWeight:
                                        kgToLb(state.weeklyWeightLoss.toDouble()).toString(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
