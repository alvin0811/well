import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_path/features/onboarding/bmi_calculations/ui/widgets/bmi_ideal_wight_page.dart';
import 'package:well_path/features/onboarding/bmi_calculations/ui/widgets/bmi_weekly_goal_weight_page.dart';

import '../../../../corewidgets/app_bar_back_button.dart';
import '../../../../corewidgets/well_path_app_bar.dart';
import '../../../../corewidgets/wellpathbutton.dart';
import '../../../../data/local/auth_store.dart';
import '../../../../extensions/extensions.dart';
import '../../../../helper/logger/logger.dart';
import '../../../../helper/mixins/loading_mixin.dart';
import '../../../../helper/mixins/show_message_mixin.dart';
import '../../meditation/ui/meditation_page.dart';
import '../cubit/bmi_calculation_cubit.dart';
import '../cubit/bmi_calculation_navigation_enums.dart';
import '../models/bmi_calculation_state.dart';
import 'widgets/bmi_height_page.dart';
import 'widgets/bmi_ideal_and_weekly_goal_page.dart';
import 'widgets/bmi_result_widget.dart';
import 'widgets/bmi_weight_page.dart';

class BmiCalculationPage extends StatefulWidget {
  static const route = '/bmi-calculations';
  const BmiCalculationPage({Key? key}) : super(key: key);

  @override
  State<BmiCalculationPage> createState() => _BmiCalculationPageState();
}

class _BmiCalculationPageState extends State<BmiCalculationPage>
    with Loading, Message {
  late final _cubit = context.read<BmiCalculationCubit>();
  late final authStore = AuthStore();
  bool? isFromSetting = false;
  int ft = 0;
  int inches = 0;
  int kg = 0;
  @override
  void initState() {
    super.initState();
    _checkIsComingFromSettings();

    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    _cubit.getBmiCalculation();
  }

  void _checkIsComingFromSettings() async {
    isFromSetting = await authStore.getIsComingFromSettings();
    Logger.e(isFromSetting.toString());
  }

  void _initNavigationListener() {
    _cubit.navigation.listen((event) {
      switch (event) {
        case BmiCalculationNavigation.medications:
          isFromSetting == true
              ? _navigateToSettingsPage()
              : _navigateToMedications();
          break;
      }
    });
  }

  void _navigateToMedications() {
    context.navigator.pushNamed(MeditationPage.route);
  }

  void _navigateToSettingsPage() {
    // context.navigator.popAndPushNamed(SettingsPage.route);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiCalculationCubit, BmiCalculationState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: WellPathAppBar(
            leading: AppBarBackButton(
              onBackPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Stack(
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              isFromSetting == true
                                  ? const SizedBox.square(dimension: 1)
                                  : Text(
                                      'Step 2 of 8',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: const Color(0xff4AB7C3),
                                          ),
                                    ),
                              isFromSetting == true
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: Text('BMI Calculation',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
                                    )
                                  : Text('BMI Calculation',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                              const SizedBox(height: 12),
                              Text(
                                'Select Height',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: const Color(0xff4AB7C3),
                                    ),
                              ),
                              const SizedBox(height: 12),
                              BmiHeightPage(
                                ft: state.heightFt,
                                inches: state.heightIn,
                                cm: state.heightCm,
                                onHeightFtSelectedItemChanged: (index) {
                                  ft = (index + 1);
                                  _cubit.inchesToCm(
                                    ft,
                                    inches,
                                  );
                                },
                                onHeightInchesSelectedItemChanged: (index) {
                                  inches = (index);
                                  _cubit.inchesToCm(
                                    ft,
                                    inches,
                                  );
                                },
                              ),
                              const SizedBox(height: 22),
                              Text(
                                'Select Weight',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: const Color(0xff4AB7C3),
                                    ),
                              ),
                              const SizedBox(height: 12),
                              BmiWeightPage(
                                ft: state.heightFt,
                                lb: state.weightLb.toString(),
                                kg: state.weightKg,
                                onWeightKgSelectedItemChanged: (index) {
                                  kg = (index + 1);
                                  _cubit.kgToLb(
                                    kg,
                                  );
                                },
                              ),
                              const SizedBox(height: 22),
                              Text(
                                'Select Ideal Weight',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: const Color(0xff4AB7C3),
                                    ),
                              ),
                              const SizedBox(height: 12),
                              BmiIdealWeightPage(
                                ft: state.heightFt,
                                lb: state.idealWeightLb.toString(),
                                kg: state.idealWeightKg,
                                onWeightKgSelectedItemChanged: (index) {
                                  kg = (index + 1);
                                  _cubit.idealWeightKgToLb(
                                    kg,
                                  );
                                },
                              ),
                              const SizedBox(height: 22),
                              Text(
                                'Select Weekly Goal Weight Loss',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: const Color(0xff4AB7C3),
                                    ),
                              ),
                              const SizedBox(height: 12),
                              BmiWeeklyGoalWeightPage(
                                ft: state.heightFt,
                                lb: state.weeklyGoalWeightLb.toString(),
                                kg: state.weeklyGoalWeightKg,
                                onWeightKgSelectedItemChanged: (index) {
                                  kg = (index + 1);
                                  _cubit.weeklyWeightKgToLb(
                                    kg,
                                  );
                                },
                              ),
                              // Text(
                              //   'Select Ideal & Weekly Goal Weight',
                              //   style: Theme.of(context)
                              //       .textTheme
                              //       .bodyMedium
                              //       ?.copyWith(
                              //         color: const Color(0xff4AB7C3),
                              //       ),
                              // ),
                              // const SizedBox(height: 12),
                              // BmiIdealAndWeeklyGoalWeightPage(
                              //   weeklyGoalWeightInKg: state.weeklyGoalWeight,
                              //   idealWeightInKg: state.idealWeight,
                              //   onIdealWeightSelectedItemChanged: (index) {
                              //     _cubit.idealWeight(index + 1);
                              //   },
                              //   onWeeklyGoalWeightSelectedItemChanged: (index) {
                              //     _cubit.weeklyGoalWeight(index + 1);
                              //   },
                              // ),
                              const SizedBox(height: 22),
                              Align(
                                alignment: Alignment.center,
                                child: BmiResultWidget(
                                  bmi: state.bmi,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: WellPathButton(
                          buttonText: 'Save & Continue',
                          onPressed: () {
                            if (state.heightFt != 0 && state.weightKg != 0) {
                              _cubit.save();
                            } else {
                              BotToast.showText(text: 'Please select value');
                            }
                            // Navigator.of(context).pushNamed('/medications');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
