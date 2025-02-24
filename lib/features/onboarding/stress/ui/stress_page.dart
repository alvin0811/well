import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/colors/colors.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/custom_container_widget.dart';
import 'package:well_path/corewidgets/skip_action_app_bar_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/onboarding/stress/cubit/stress_cubit.dart';
import 'package:well_path/features/onboarding/stress/cubit/stress_navigation_enums.dart';
import 'package:well_path/features/onboarding/stress/models/stress_state.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';

import '../../../../corewidgets/wellpathbutton.dart';

class StressPage extends StatefulWidget {
  static const route = '/stress';
  const StressPage({Key? key}) : super(key: key);

  @override
  State<StressPage> createState() => _StressPageState();
}

class _StressPageState extends State<StressPage> with Loading, Message {
  late final _cubit = context.read<StressCubit>();

  @override
  void initState() {
    super.initState();
    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    _cubit.getStressList();
  }

  void _initNavigationListener() {
    _cubit.navigation.listen((event) {
      switch (event) {
        case StressNavigation.physicalactivity:
          _navigateToStress();
          break;
      }
    });
  }

  void _navigateToStress() {
    context.navigator.pushNamed("/physical_activity");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StressCubit, StressState>(
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
                  Navigator.of(context).pushNamed('/physical_activity',
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
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Step 4 of 8',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: const Color(0XFF4AB7C3),
                                        fontSize: 14),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                "Stress",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Please select the major stressors in your life?',
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
                              GridView.count(
                                physics: const NeverScrollableScrollPhysics(),
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 15,
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                childAspectRatio: (1 / 0.25),
                                children: [
                                  for (var i = 0;
                                      i < state.stressItems!.length;
                                      i++)
                                    StressCard(
                                      index: i,
                                      name: state.stressItems![i].title,
                                      onSelectedMedications:
                                          (int index, int majorStressId) {
                                        if (state.majorStressList
                                            .contains(majorStressId)) {
                                          _cubit.updateStressValues(
                                              index, majorStressId, true);
                                        } else {
                                          _cubit.updateStressValues(
                                              index, majorStressId, false);
                                        }
                                      },
                                      isOn: state.stressItems![i].selected,
                                      majorStressId: state.stressItems![i].id,
                                    ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Do you practice any coping mechanisms currently?',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 200,
                                child: GridView.count(
                                  physics: const NeverScrollableScrollPhysics(),
                                  mainAxisSpacing: 12,
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 12,
                                  childAspectRatio: (1 / .8),
                                  children: [
                                    for (var i = 0;
                                        i < state.copingMechanismList.length;
                                        i++)
                                      CopyingMechanismCard(
                                        selectedValue: i,
                                        imagePath: state
                                            .copingMechanismList[i].imagePath,
                                        imageName: state
                                            .copingMechanismList[i].imageName,
                                        onSelectedMedications:
                                            (int index, int copingMechanismId) {
                                          if (state.copingMechanism
                                              .contains(copingMechanismId)) {
                                            _cubit.updateCopingMechanismValues(
                                                copingMechanismId, true);
                                          } else {
                                            _cubit.updateCopingMechanismValues(
                                                copingMechanismId, false);
                                          }
                                        },
                                        index: i,
                                        isOn: state
                                            .copingMechanismList[i].isSelected,
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
                            // Navigator.of(context).pushNamed(
                            //     '/physical_activity',
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

typedef IntCallbackCopingMechanism = void Function(int id, int index);
typedef IntCallbackStress = void Function(int id, int index);

class StressCard extends StatefulWidget {
  final String name;
  final int majorStressId;
  final int index;
  final bool? isOn;
  final IntCallbackStress onSelectedMedications;
  const StressCard(
      {super.key,
      required this.name,
      required this.onSelectedMedications,
      required this.index,
      required this.isOn,
      required this.majorStressId});
  @override
  State<StressCard> createState() => _StressCardState();
}

class _StressCardState extends State<StressCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onSelectedMedications(widget.index, widget.majorStressId);
      },
      child: ShadowContainerWidget(
        color: widget.isOn! ? appPrimaryBlueColor : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: widget.isOn! ? Colors.white : Colors.black,
                    fontSize: 12),
              ),
              Image.asset(
                "assets/images/ic_checkmark.png",
                color: widget.isOn! ? Colors.white : placeHolderTextColor,
                width: 16,
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CopyingMechanismCard extends StatefulWidget {
  final String imagePath, imageName;
  final int index;
  final bool isOn;
  final int selectedValue;
  final IntCallbackCopingMechanism onSelectedMedications;
  const CopyingMechanismCard(
      {Key? key,
      required this.imagePath,
      required this.imageName,
      required this.onSelectedMedications,
      required this.index,
      required this.isOn,
      required this.selectedValue})
      : super(key: key);

  @override
  State<CopyingMechanismCard> createState() => _CopyingMechanismCardState();
}

class _CopyingMechanismCardState extends State<CopyingMechanismCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onSelectedMedications(widget.index, widget.selectedValue);
      },
      child: ShadowContainerWidget(
        radius: 20,
        color: widget.isOn ? const Color(0xFF4AB7C3) : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              widget.imagePath,
              colorFilter: widget.isOn
                  ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                  : const ColorFilter.mode(
                      placeHolderTextColor, BlendMode.srcIn),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.imageName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: widget.isOn ? Colors.white : Colors.black,
                  fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

class CopingMechanism {
  int index;
  String imageName;
  String imagePath;
  bool isSelected;
  CopingMechanism(this.index, this.imageName, this.imagePath, this.isSelected);
}
