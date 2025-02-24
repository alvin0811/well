import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_path/colors/colors.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/custom_container_widget.dart';
import 'package:well_path/corewidgets/skip_action_app_bar_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/onboarding/meditation/cubit/medications_cubit.dart';
import 'package:well_path/features/onboarding/meditation/cubit/medications_navigation_enums.dart';
import 'package:well_path/features/onboarding/meditation/models/medications_state.dart';
import 'package:well_path/features/onboarding/stress/ui/stress_page.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';

class MeditationPage extends StatefulWidget {
  static const route = '/medications';
  const MeditationPage({Key? key}) : super(key: key);

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> with Loading, Message {
  late final _cubit = context.read<MeditationCubit>();
  int _value = 1;
  int _lifestyleModifications = 0;

  List<String> medicationsChoices = [
    "Diuretics",
    "ACE Inhibitors",
    "Angiotensin Receptor Blockers",
    "Peripheral adrenergic inhibitors",
    "Central Agonists"
  ];

  @override
  void initState() {
    super.initState();
    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    _cubit.getMeditationList();
  }

  void _initNavigationListener() {
    _cubit.navigation.listen((event) {
      switch (event) {
        case MeditationNavigation.stress:
          _navigateToStress();
          break;
      }
    });
  }

  void _navigateToStress() {
    context.navigator.pushNamed(StressPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeditationCubit, MeditationState>(
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
                  Navigator.of(context).pushNamed(StressPage.route,
                      arguments: "some dummy data");
                })
              ]),
          body: Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Step 3 of 8',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: const Color(0XFF4AB7C3), fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "Medications",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Medications',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: const Color(0XFF4AB7C3), fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'How many medications are you currently on to help with your blood pressure? ',
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                                MyRadioListTile<int>(
                                value: 0,
                                groupValue: state.medicationLevel ?? -1,
                                leading: '0',
                                title: const Text(''),
                                onChanged: (value) {
                                  _value = value!;
                                  _cubit.onMedicationLevelChanged(_value);
                                },
                              ),
                              MyRadioListTile<int>(
                                value: 1,
                                groupValue: state.medicationLevel ?? -1,
                                leading: '1',
                                title: const Text(''),
                                onChanged: (value) {
                                  _value = value!;
                                  _cubit.onMedicationLevelChanged(_value);
                                },
                              ),
                              MyRadioListTile<int>(
                                value: 2,
                                groupValue: state.medicationLevel ?? -1,
                                leading: '2',
                                title: const Text(''),
                                onChanged: (value) {
                                  _value = value!;
                                  _cubit.onMedicationLevelChanged(_value);
                                },
                              ),
                              MyRadioListTile<int>(
                                value: 3,
                                groupValue: state.medicationLevel ?? -1,
                                leading: '3',
                                title: const Text(''),
                                onChanged: (value) {
                                  _value = value!;
                                  _cubit.onMedicationLevelChanged(_value);
                                },
                              ),
                              MyRadioListTile<int>(
                                value: 4,
                                groupValue: state.medicationLevel ?? -1,
                                leading: '4',
                                title: const Text(''),
                                onChanged: (value) {
                                  _value = value!;
                                  _cubit.onMedicationLevelChanged(_value);
                                },
                              ),
                              MyRadioListTile<int>(
                                  value: 5,
                                  groupValue: state.medicationLevel ?? -1,
                                  leading: '5',
                                  title: const Text(''),
                                  onChanged: (value) {
                                    _value = value!;
                                    _cubit.onMedicationLevelChanged(_value);
                                  })
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Medications',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: const Color(0XFF4AB7C3), fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'Please select all blood pressure medications you’re currently taking form the list below',
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        for (var i = 0;
                            i < state.medicationListItems.medicationList.length;
                            i++)
                          MedicationCards(
                            name: state
                                .medicationListItems.medicationList[i].title,
                            index: i,
                            selectedValue:
                                state.medicationListItems.medicationList[i].id,
                            onSelectedMedications: (indexValue, index) {
                              if (state.medicationIds.contains(indexValue)) {
                                _cubit.selectedState(indexValue, true);
                              } else {
                                _cubit.selectedState(indexValue, false);
                              }
                              _cubit.updateSelectedState(
                                  state.medicationListItems, index);
                            },
                            isOn: state.medicationListItems.medicationList[i]
                                    .isSelected ??
                                false,
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Lifestyle Modifications',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: const Color(0XFF4AB7C3), fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'How knowledgeable would you say you’re on various lifestyle modifications that can help you manage your blood pressure?',
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        LifeStyleModifications(
                          // _lifestyleModifications,
                          state.activityLevel ?? -1,
                          onSelectedLifeStyleModifications: (value) {
                            _lifestyleModifications = value;
                            _cubit.onValueActivityLevelChanged(
                              _lifestyleModifications,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        WellPathButton(
                          onPressed: () {
                            _cubit.save();
                            // Navigator.of(context).pushNamed('/stress',
                            //     arguments: "some dummy data");
                          },
                          buttonText: "Save & Continue",
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          child: _customRadioButton,
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      width: 45,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0XFF4AB7C3) : null,
        borderRadius: const BorderRadius.all(Radius.circular(360)),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Text(
        leading,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[600]!,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}

typedef IntCallbackOne = void Function(int id, int index);

class MedicationCards extends StatefulWidget {
  final String name;
  final int index;
  final int selectedValue;
  final bool isOn;
  final IntCallbackOne onSelectedMedications;
  const MedicationCards({
    super.key,
    required this.selectedValue,
    required this.name,
    required this.onSelectedMedications,
    required this.index,
    required this.isOn,
  });

  @override
  State<MedicationCards> createState() => _MedicationCardsState();
}

class _MedicationCardsState extends State<MedicationCards> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          // widget.onSelectedMedications(widget.selectedValue);
          widget.onSelectedMedications(widget.selectedValue, widget.index);
          // isSelected = !isSelected;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ShadowContainerWidget(
          height: 40,
          color: widget.isOn ? appPrimaryBlueColor : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: widget.isOn ? Colors.white : Colors.black,
                      fontSize: 12),
                ),
                Image.asset(
                  "assets/images/ic_checkmark.png",
                  color: widget.isOn ? Colors.white : placeHolderTextColor,
                  width: 16,
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

typedef IntCallbackLifeStyleModification = void Function(int id);

class LifeStyleModifications extends StatefulWidget {
  int lifestyleModifications;
  final IntCallbackLifeStyleModification onSelectedLifeStyleModifications;
  LifeStyleModifications(
    this.lifestyleModifications, {
    super.key,
    required this.onSelectedLifeStyleModifications,
  });

  @override
  State<LifeStyleModifications> createState() => _LifeStyleModificationsState();
}

class _LifeStyleModificationsState extends State<LifeStyleModifications> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            widget.onSelectedLifeStyleModifications(1);
            // setState(() {
            //   widget.lifestyleModifications = 1;
            // });
          },
          child: CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFFD0D0D0),
            child: CircleAvatar(
              backgroundColor: widget.lifestyleModifications >= 1
                  ? const Color(0xFF4AB7C3)
                  : Colors.white,
              radius: 13,
              child: Text("1",
                  style: TextStyle(
                      color: widget.lifestyleModifications >= 1
                          ? Colors.white
                          : const Color(0xFFA9A9A9),
                      fontSize: 11)),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onSelectedLifeStyleModifications(2);
            // setState(() {
            //   widget.lifestyleModifications = 2;
            // });
          },
          child: CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFFD0D0D0),
            child: CircleAvatar(
              backgroundColor: widget.lifestyleModifications >= 2
                  ? const Color(0xFF4AB7C3)
                  : Colors.white,
              radius: 13,
              child: Text(
                "2",
                style: TextStyle(
                    color: widget.lifestyleModifications >= 2
                        ? Colors.white
                        : const Color(0xFFA9A9A9),
                    fontSize: 11),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onSelectedLifeStyleModifications(3);
            //             setState(() {
            //   widget.lifestyleModifications = 3;
            // });
          },
          child: CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFFD0D0D0),
            child: CircleAvatar(
              backgroundColor: widget.lifestyleModifications >= 3
                  ? const Color(0xFF4AB7C3)
                  : Colors.white,
              radius: 13,
              child: Text("3",
                  style: TextStyle(
                      color: widget.lifestyleModifications >= 3
                          ? Colors.white
                          : const Color(0xFFA9A9A9),
                      fontSize: 11)),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onSelectedLifeStyleModifications(4);
            // setState(() {
            //   widget.lifestyleModifications = 4;
            // });
          },
          child: CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFFD0D0D0),
            child: CircleAvatar(
              backgroundColor: widget.lifestyleModifications >= 4
                  ? const Color(0xFF4AB7C3)
                  : Colors.white,
              radius: 13,
              child: Text("4",
                  style: TextStyle(
                      color: widget.lifestyleModifications >= 4
                          ? Colors.white
                          : const Color(0xFFA9A9A9),
                      fontSize: 11)),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onSelectedLifeStyleModifications(5);
            // setState(() {
            //   widget.lifestyleModifications = 5;
            // });
          },
          child: CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFFD0D0D0),
            child: CircleAvatar(
              backgroundColor: widget.lifestyleModifications >= 5
                  ? const Color(0xFF4AB7C3)
                  : Colors.white,
              radius: 13,
              child: Text("5",
                  style: TextStyle(
                      color: widget.lifestyleModifications >= 5
                          ? Colors.white
                          : const Color(0xFFA9A9A9),
                      fontSize: 11)),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onSelectedLifeStyleModifications(6);
            // setState(() {
            //   widget.lifestyleModifications = 6;
            // });
          },
          child: CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFFD0D0D0),
            child: CircleAvatar(
              backgroundColor: widget.lifestyleModifications >= 6
                  ? const Color(0xFF4AB7C3)
                  : Colors.white,
              radius: 13,
              child: Text("6",
                  style: TextStyle(
                      color: widget.lifestyleModifications >= 6
                          ? Colors.white
                          : const Color(0xFFA9A9A9),
                      fontSize: 11)),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onSelectedLifeStyleModifications(7);
            // setState(() {
            //   widget.lifestyleModifications = 7;
            // });
          },
          child: CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFFD0D0D0),
            child: CircleAvatar(
              backgroundColor: widget.lifestyleModifications >= 7
                  ? const Color(0xFF4AB7C3)
                  : Colors.white,
              radius: 13,
              child: Text("7",
                  style: TextStyle(
                      color: widget.lifestyleModifications >= 7
                          ? Colors.white
                          : const Color(0xFFA9A9A9),
                      fontSize: 11)),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onSelectedLifeStyleModifications(8);
            // setState(() {
            //   widget.lifestyleModifications = 8;
            // });
          },
          child: CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFFD0D0D0),
            child: CircleAvatar(
              backgroundColor: widget.lifestyleModifications >= 8
                  ? const Color(0xFF4AB7C3)
                  : Colors.white,
              radius: 13,
              child: Text("8",
                  style: TextStyle(
                      color: widget.lifestyleModifications >= 8
                          ? Colors.white
                          : const Color(0xFFA9A9A9),
                      fontSize: 11)),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onSelectedLifeStyleModifications(9);
            // setState(() {
            //   widget.lifestyleModifications = 9;
            // });
          },
          child: CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFFD0D0D0),
            child: CircleAvatar(
              backgroundColor: widget.lifestyleModifications >= 9
                  ? const Color(0xFF4AB7C3)
                  : Colors.white,
              radius: 13,
              child: Text("9",
                  style: TextStyle(
                      color: widget.lifestyleModifications >= 9
                          ? Colors.white
                          : const Color(0xFFA9A9A9),
                      fontSize: 11)),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onSelectedLifeStyleModifications(10);
            // setState(() {
            //   widget.lifestyleModifications = 10;
            // });
          },
          child: CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFFD0D0D0),
            child: CircleAvatar(
              backgroundColor: widget.lifestyleModifications >= 10
                  ? const Color(0xFF4AB7C3)
                  : Colors.white,
              radius: 13,
              child: Text(
                "10",
                style: TextStyle(
                  color: widget.lifestyleModifications >= 10
                      ? Colors.white
                      : const Color(0xFFA9A9A9),
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
