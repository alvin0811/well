import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/colors/colors.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/binary_choice_widget.dart';
import 'package:well_path/corewidgets/custom_container_widget.dart';
import 'package:well_path/corewidgets/skip_action_app_bar_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/onboarding/food/ui/food_page.dart';
import 'package:well_path/features/onboarding/physical_activity/cubit/physical_activity_cubit.dart';
import 'package:well_path/features/onboarding/physical_activity/cubit/physical_activity_navigation_enums.dart';
import 'package:well_path/features/onboarding/physical_activity/models/physical_activity_state.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';

import '../../../../corewidgets/wellpathbutton.dart';
import '../../../../corewidgets/well_path_textfield.dart';

class PhysicalActivityPage extends StatefulWidget {
  static const route = '/physical_activity';
  const PhysicalActivityPage({Key? key}) : super(key: key);

  @override
  State<PhysicalActivityPage> createState() => _PhysicalActivityPageState();
}

class _PhysicalActivityPageState extends State<PhysicalActivityPage>
    with Loading, Message {
  late final _cubit = context.read<PhysicalActivityCubit>();

  final TextEditingController _activeTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    _initTextListener();
    _cubit.getDisabilitiesList();
  }

  void _initTextListener() {
    _cubit.activeTime.listen((event) {
      _activeTimeController.text = event.isNotNull ? event.toString() : "";
    });
  }

  void _initNavigationListener() {
    _cubit.navigation.listen((event) {
      switch (event) {
        case PhysicalActivityNavigation.food:
          _navigateToFood();
          break;
      }
    });
  }

  void _navigateToFood() {
    context.navigator.pushNamed(FoodPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhysicalActivityCubit, PhysicalActivityState>(
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
                      .pushNamed('/food', arguments: "some dummy data");
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
                                'Step 5 of 8',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: const Color(0XFF4AB7C3),
                                        fontSize: 14),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                "Physical Activity",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Approximately how many minutes are you active per Week?',
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
                                textEditingController: _activeTimeController,
                                horizontalPadding: 0,
                                hintText: '00',
                                prefixIcon: null,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 17.0),
                                  child: SvgPicture.asset(
                                      "assets/images/ic_clock.svg"),
                                ),
                                obscureText: false,
                                onChanged: (text) {
                                  if (text.isNotEmpty) {
                                    _cubit.setActiveTime(int.parse(text));
                                  }
                                },
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              BinaryChoiceWidget(
                                  isSelected: state.haveDisability,
                                  question:
                                      'Do you have any chronic pain or disabilities inhibiting daily activity?',
                                  onYesPressed: () {
                                    _cubit.haveDisability();
                                  },
                                  onNoPressed: () {
                                    _cubit.notDisability();
                                  }),
                              // YesNoWidget(
                              //   question:
                              //       'Do you have any chronic pain or disabilities inhibitingdaily activity?',
                              //   onNoPressed: () {},
                              //   onYesPressed: () {},
                              // ),
                              const SizedBox(
                                height: 26,
                              ),
                              Text(
                                'Chronic Disabilities',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              SizedBox(
                                height: 250,
                                child: GridView.count(
                                  physics: const NeverScrollableScrollPhysics(),
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  crossAxisCount: 2,
                                  childAspectRatio: (1 / 0.25),
                                  children: [
                                    for (var i = 0;
                                        i < state.disabilityItems.length;
                                        i++)
                                      ChronicDisabilitiesCard(
                                        id: state.disabilityItems[i].id,
                                        name: state.disabilityItems[i].title,
                                        onSelectedChronicDisability: (index) {
                                          _cubit.updateChronic(index);
                                        },
                                        isOn: state
                                            .disabilityItems[i].isSelected!,
                                      )
                                  ],
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
                          onPressed: () {
                            _cubit.save();
                            // Navigator.of(context).pushNamed('/food',
                            //     arguments: "some dummy data");
                          },
                          buttonText: "Save & Continue",
                        ),
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

class YesNoWidget extends StatefulWidget {
  final String question;
  final bool? isYesOn;
  final bool? isNoOn;
  final void Function() onYesPressed;
  final void Function() onNoPressed;

  const YesNoWidget({
    Key? key,
    required this.question,
    required this.onYesPressed,
    required this.onNoPressed,
    required this.isYesOn,
    required this.isNoOn,
  }) : super(key: key);

  @override
  State<YesNoWidget> createState() => _YesNoWidgetState();
}

class _YesNoWidgetState extends State<YesNoWidget> {
  late bool isYes = widget.isYesOn ?? false;
  late bool isNo = widget.isNoOn ?? false;

  @override
  void initState() {
    super.initState();
  }

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
                setState(() {
                  isYes = !isYes;
                  isNo = false;
                });
                widget.onYesPressed;
              },
              child: ShadowContainerWidget(
                color: isYes ? const Color(0xFF4AB7C3) : Colors.white,
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
                          color: isYes ? Colors.white : placeHolderTextColor,
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
                                  color: isYes ? Colors.white : Colors.black,
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
                setState(() {
                  isYes = false;
                  isNo = !isNo;
                });
                widget.onNoPressed;
              },
              child: ShadowContainerWidget(
                color: isNo ? const Color(0xFF4AB7C3) : Colors.white,
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
                                isNo ? Colors.white : placeHolderTextColor,
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
                                  color: isNo
                                      ? Colors.white
                                      : placeHolderTextColor,
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

typedef IntCallback = void Function(int id);

class ChronicDisabilitiesCard extends StatefulWidget {
  final String name;
  final int id;
  final IntCallback onSelectedChronicDisability;
  final bool isOn;
  const ChronicDisabilitiesCard(
      {super.key,
      required this.name,
      required this.onSelectedChronicDisability,
      required this.isOn,
      required this.id});

  @override
  State<ChronicDisabilitiesCard> createState() =>
      _ChronicDisabilitiesCardState();
}

class _ChronicDisabilitiesCardState extends State<ChronicDisabilitiesCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onSelectedChronicDisability(widget.id);
      },
      child: ShadowContainerWidget(
        height: 40,
        color: widget.isOn ? const Color(0xFF4AB7C3) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: widget.isOn ? Colors.white : Colors.black,
                    fontSize: 13),
              ),
              Image.asset(
                "assets/images/ic_checkmark.png",
                color: widget.isOn ? Colors.white : placeHolderTextColor,
                width: 20,
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
