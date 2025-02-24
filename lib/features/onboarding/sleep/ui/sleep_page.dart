import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/skip_action_app_bar_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/onboarding/food/ui/food_page.dart';
import 'package:well_path/features/onboarding/sleep/cubit/sleep_cubit.dart';
import 'package:well_path/features/onboarding/sleep/cubit/sleep_navigation_enums.dart';
import 'package:well_path/features/onboarding/sleep/models/sleep_state.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';

import '../../../../corewidgets/wellpathbutton.dart';
import '../../../../corewidgets/well_path_textfield.dart';

class SleepPage extends StatefulWidget {
  static const route = '/sleep';
  const SleepPage({Key? key}) : super(key: key);

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> with Loading, Message {
  late final _cubit = context.read<SleepCubit>();
  final TextEditingController _hoursPerNightController =
      TextEditingController();
  final TextEditingController _sleepInteruptionsController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _initTextListener();
    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    _cubit.getSleep();
  }

  void _initTextListener() {
    _cubit.hoursPerNightAverage.listen((event) {
      _hoursPerNightController.text = event == 0 ? "" : event.toString();
    });
    _cubit.sleepInteruption.listen((event) {
      _sleepInteruptionsController.text = event == 0 ? "" : event.toString();
    });
  }

  void _initNavigationListener() {
    _cubit.navigation.listen((event) {
      switch (event) {
        case SleepNavigation.lifestyle:
          _navigateToLifeStyle();
          break;
      }
    });
  }

  void _navigateToLifeStyle() {
    context.navigator.pushNamed("/lifestyle_elements");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SleepCubit, SleepState>(
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
                SkipActionButton(onSkipPressed: () {
                  Navigator.of(context).pushNamed('/lifestyle_elements',
                      arguments: "some dummy data");
                })
              ]),
          body: Stack(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Step 7 of 8',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: const Color(0XFF4AB7C3),
                                        fontSize: 14),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                "Sleep",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                'How many hours per night do you sleep on average per week?',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              WellPathTextField(
                                textEditingController: _hoursPerNightController,
                                horizontalPadding: 0,
                                hintText: '00',
                                prefixIcon: null,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 17.0),
                                  child: SvgPicture.asset(
                                      "assets/images/ic_clock.svg",
                                      colorFilter: const ColorFilter.mode(
                                          Colors.white, BlendMode.srcIn)),
                                ),
                                obscureText: false,
                                onChanged: (text) {
                                  if (text.isNotEmpty) {
                                    _cubit.onChangeAverageSleepPerWeek(
                                        int.parse(text));
                                  }
                                },
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              YesNoWidgetFoodPage(
                                isSelected: state.fellWellRested,
                                question:
                                    'Do you feel well rested when you wake up?',
                                onNoPressed: () {
                                  _cubit.onClickChangeFeelRested(false);
                                },
                                onYesPressed: () {
                                  _cubit.onClickChangeFeelRested(true);
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              YesNoWidgetFoodPage(
                                isSelected: state.sleepSameTime,
                                question:
                                    'Do you go to bed at the same time each night?',
                                onNoPressed: () {
                                  _cubit.onClickChangeSleepSameTime(false);
                                },
                                onYesPressed: () {
                                  _cubit.onClickChangeSleepSameTime(true);
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'How many sleep interruptions do you experience each night?',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              WellPathTextField(
                                textEditingController:
                                    _sleepInteruptionsController,
                                horizontalPadding: 0,
                                hintText: '00',
                                prefixIcon: null,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 17.0),
                                  child: SvgPicture.asset(
                                      "assets/images/ic_clock.svg",
                                      colorFilter: const ColorFilter.mode(
                                          Colors.white, BlendMode.srcIn)),
                                ),
                                obscureText: false,
                                onChanged: (text) {
                                  if (text.isNotEmpty) {
                                    _cubit.onChangeSleepInteruption(
                                        int.parse(text));
                                  }
                                },
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              YesNoWidgetFoodPage(
                                isSelected: state.dayNap,
                                question: 'Do you nap during the day?',
                                onNoPressed: () {
                                  _cubit.onClickChangeNap(false);
                                },
                                onYesPressed: () {
                                  _cubit.onClickChangeNap(true);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: WellPathButton(
                        onPressed: () {
                          _cubit.save();
                        },
                        buttonText: "Save & Continue",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
