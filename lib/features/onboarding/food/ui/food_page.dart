import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:well_path/colors/colors.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/custom_container_widget.dart';
import 'package:well_path/corewidgets/skip_action_app_bar_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/onboarding/food/cubit/food_cubit.dart';
import 'package:well_path/features/onboarding/food/cubit/food_navigation_enums.dart';
import 'package:well_path/features/onboarding/food/models/food_state.dart';
import 'package:well_path/features/onboarding/sleep/ui/sleep_page.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';
import '../../../../corewidgets/wellpathbutton.dart';
import '../../../../corewidgets/well_path_textfield.dart';
import '../../stress/ui/stress_page.dart';

class FoodPage extends StatefulWidget {
  static const route = '/food';
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> with Loading, Message {
  late final _cubit = context.read<FoodCubit>();
  final TextEditingController _homeCookedController = TextEditingController();
  final TextEditingController _palmSizeController = TextEditingController();
  final TextEditingController _alcoholicBeveragesController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _initTextListener();
    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    _cubit.getFoodList();
  }

  void _initTextListener() {
    _cubit.homeCookedMeal.listen((event) {
      _homeCookedController.text = event == 0 ? "" : event.toString();
    });
    _cubit.palmSizedMeal.listen((event) {
      _palmSizeController.text = event == 0 ? "" : event.toString();
    });
    _cubit.alcoholicBeverage.listen((event) {
      _alcoholicBeveragesController.text = event == 0 ? "" : event.toString();
    });
  }

  void _initNavigationListener() {
    _cubit.navigation.listen((event) {
      switch (event) {
        case FoodNavigation.sleep:
          _navigateToSleep();
          break;
      }
    });
  }

  void _navigateToSleep() {
    context.navigator.pushNamed(SleepPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
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
                  Navigator.of(context)
                      .pushNamed('/sleep', arguments: "some dummy data");
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
                                'Step 6 of 8',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: const Color(0XFF4AB7C3),
                                        fontSize: 14),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                "Food",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              YesNoWidgetFoodPage(
                                isSelected: state.cookOwnFood,
                                question: 'Do you cook your own food?',
                                onNoPressed: () {
                                  debugPrint("false");
                                  _cubit.onClickChangeDoCookOwnFood(false);
                                },
                                onYesPressed: () {
                                  _cubit.onClickChangeDoCookOwnFood(true);
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              YesNoWidgetFoodPage(
                                isSelected: state.eatAtHome,
                                question: 'Do you eat at home?',
                                onNoPressed: () {
                                  _cubit.onClickChangeDoEatAtHome(false);
                                },
                                onYesPressed: () {
                                  _cubit.onClickChangeDoEatAtHome(true);
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'How many home cooked meals do you eat at home per week?',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              WellPathTextField(
                                textEditingController: _homeCookedController,
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
                                    _cubit.onChangeHomeCookedMeals(
                                        int.parse(text));
                                  }
                                },
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              YesNoWidgetFoodPage(
                                isSelected: state.feelFull,
                                question:
                                    'Do you feel full after eating a meal?',
                                onNoPressed: () {
                                  _cubit.onClickChangeDoFeelFull(false);
                                },
                                onYesPressed: () {
                                  _cubit.onClickChangeDoFeelFull(true);
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              YesNoWidgetFoodPage(
                                isSelected: state.averageMealHealthy,
                                question:
                                    'Would you describe your average meal as healthy?',
                                onNoPressed: () {
                                  _cubit.onClickChangeDoAverageMealAshealthy(
                                      false);
                                },
                                onYesPressed: () {
                                  _cubit.onClickChangeDoAverageMealAshealthy(
                                      true);
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              YesNoWidgetFoodPage(
                                isSelected: state.feelGuilty,
                                question:
                                    'Do you feel guilty after eating meals?',
                                onNoPressed: () {
                                  _cubit.onClickChangeDoFeelGuilty(false);
                                },
                                onYesPressed: () {
                                  _cubit.onClickChangeDoFeelGuilty(true);
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'How Many palm size portion of fruits/vegetable do youeat per day?',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              WellPathTextField(
                                textEditingController: _palmSizeController,
                                horizontalPadding: 2,
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
                                    _cubit.onChangePalmSized(int.parse(text));
                                  }
                                },
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'What are your favourite healthy food items?',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                crossAxisCount: 2,
                                childAspectRatio: (1 / .25),
                                children: [
                                  for (var i = 0;
                                      i < state.healthyFoodIds.length;
                                      i++)
                                    StressCard(
                                      index: i,
                                      name: state.healthyFoodIds[i].title,
                                      onSelectedMedications:
                                          (int index, int healthyFoodItemId) {
                                        _cubit.updateHealthyFoodItem(
                                            index, healthyFoodItemId);
                                      },
                                      isOn: state.healthyFoodIds[i].isHealthy,
                                      majorStressId: state.healthyFoodIds[i].id,
                                    ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'What are your favourite "Unhealthy" food items?',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                crossAxisCount: 2,
                                childAspectRatio: (1 / .25),
                                children: [
                                  for (var i = 0;
                                      i < state.unhealthyFoodIds.length;
                                      i++)
                                    StressCard(
                                      index: i,
                                      name: state.unhealthyFoodIds[i].title,
                                      onSelectedMedications:
                                          (int index, int unhealthyFoodItemId) {
                                        _cubit.updateUnHealthyFoodItem(
                                            index, unhealthyFoodItemId);
                                      },
                                      isOn: state.unhealthyFoodIds[i].isHealthy,
                                      majorStressId:
                                          state.unhealthyFoodIds[i].id,
                                    ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Alcohol",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              YesNoWidgetFoodPage(
                                isSelected: state.consumeAlcohol,
                                question: 'Do you consume alcohol?',
                                onNoPressed: () {
                                  _cubit.onClickChangeDoConsumeAlcohol(false);
                                },
                                onYesPressed: () {
                                  _cubit.onClickChangeDoConsumeAlcohol(true);
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'How many alcoholic beverages do you drink per week',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              WellPathTextField(
                                textEditingController:
                                    _alcoholicBeveragesController,
                                horizontalPadding: 2,
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
                                    _cubit.onChangeAlcoholicBeverage(
                                        int.parse(text));
                                  }
                                },
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 20,
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

class YesNoWidgetFoodPage extends StatefulWidget {
  final String question;
  final bool? isSelected;
  final void Function() onYesPressed;
  final void Function() onNoPressed;

  const YesNoWidgetFoodPage({
    Key? key,
    required this.question,
    required this.onYesPressed,
    required this.onNoPressed,
    this.isSelected,
  }) : super(key: key);

  @override
  State<YesNoWidgetFoodPage> createState() => _YesNoWidgetFoodPageState();
}

class _YesNoWidgetFoodPageState extends State<YesNoWidgetFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                debugPrint("tapped");
                widget.onYesPressed();
              },
              child: ShadowContainerWidget(
                color: widget.isSelected ?? false
                    ? const Color(0xFF4AB7C3)
                    : Colors.white,
                radius: 10,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 15,
                    width: 75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/ic_checkmark.png",
                          color: widget.isSelected ?? false
                              ? Colors.white
                              : placeHolderTextColor,
                          width: 15,
                          height: 15,
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          "Yes",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: widget.isSelected ?? false
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                widget.onNoPressed();
              },
              child: ShadowContainerWidget(
                color: (widget.isSelected != null ? !widget.isSelected! : false)
                    ? const Color(0xFF4AB7C3)
                    : Colors.white,
                radius: 10,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 75,
                    height: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 15,
                          child: SvgPicture.asset(
                            "assets/images/ic_no.svg",
                            colorFilter: ColorFilter.mode(
                                (widget.isSelected != null
                                        ? !widget.isSelected!
                                        : false)
                                    ? Colors.white
                                    : placeHolderTextColor,
                                BlendMode.srcIn),
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          "No",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: (widget.isSelected != null
                                          ? !widget.isSelected!
                                          : false)
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
