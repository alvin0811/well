import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/colors/colors.dart';
import 'package:well_path/corewidgets/app_network_image.dart';
import 'package:well_path/corewidgets/skip_action_app_bar_button.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/cubit/lifestyle_element_cubit.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/cubit/lifestyle_element_navigation_enums.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/models/lifestyle_element_state.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/lifestyle_elements_api_responses/get_lifestyle_element_list_response.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/ui/selected_lifestyle_elements_page.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';

import '../../../../corewidgets/wellpathbutton.dart';

class LifeStyleElementPage extends StatefulWidget {
  static const route = '/lifestyle_elements';
  const LifeStyleElementPage({Key? key}) : super(key: key);

  @override
  State<LifeStyleElementPage> createState() => _LifeStyleElementPageState();
}

class _LifeStyleElementPageState extends State<LifeStyleElementPage>
    with Loading, Message {
  late final _cubit = context.read<LifestyleElementCubit>();
  HashSet selectedElements = HashSet();

  @override
  void initState() {
    super.initState();
    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    _cubit.getLifestyleElementList();
  }

  void _initNavigationListener() {
    _cubit.navigation.listen((event) {
      switch (event) {
        case LifestyleElementsNavigation.selectedLifestyleElements:
          _navigateToSelectedLifestyleElements();
          break;
        default:
          break;
      }
    });
  }

  void _navigateToSelectedLifestyleElements() {
    context.navigator.pushNamed(SelectedLifeStyleElementsWidget.route);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LifestyleElementCubit, LifestyleElementState>(
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
                Navigator.of(context).pushNamed('/selected_lifestyle_elements');
              })
            ],
          ),
          body: Stack(
            children: [
              SafeArea(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Step 8 of 8',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: const Color(0xff4AB7C3))),
                          Text('Lifestyle Elements',
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.center,
                            child: Text('Select Lifestyle',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: const Color(0xff4AB7C3))),
                          ),
                          const SizedBox(height: 6),
                          Expanded(
                            child: GridView.count(
                              padding: const EdgeInsets.all(10.0),
                              shrinkWrap: true,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              children: [
                                for (var i = 0;
                                    i < state.lifestyleItem.length;
                                    i++)
                                  InkWell(
                                    onTap: () {
                                      doMultiSelection(i);
                                      debugPrint(
                                          'selected Elements: $selectedElements');
                                      _cubit.updateSelectedElements(
                                          state.lifestyleItem[i].id);
                                    },
                                    child: LifestyleElementGridTile(
                                      element: state.lifestyleItem[i],
                                    ),
                                  )
                              ],
                              // List<Widget>.generate(6, (index) {
                              //   return InkWell(
                              //     onTap: () {
                              //       doMultiSelection(index);
                              //       debugPrint(
                              //           'selected Elements: $selectedElements');
                              //     },
                              //     child: LifestyleElementGridTile(
                              //       index: index,
                              //       isElementSelected:
                              //           selectedElements.contains(index),
                              //     ),
                              //   );
                              // }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: WellPathButton(
                              buttonText: 'Save & Continue',
                              onPressed: () {
                                _cubit.save();
                              },
                            ),
                          ),
                        ])),
              ),
            ],
          ),
        );
      },
    );
  }

  void doMultiSelection(int index) {
    setState(() {
      if (selectedElements.contains(index)) {
        selectedElements.remove(index);
      } else {
        selectedElements.add(index);
      }
    });
  }
}

class LifestyleElementGridTile extends StatefulWidget {
  final LifestyleListItem element;
  const LifestyleElementGridTile({super.key, required this.element});

  @override
  State<LifestyleElementGridTile> createState() =>
      _LifestyleElementGridTileState();
}

class _LifestyleElementGridTileState extends State<LifestyleElementGridTile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            // alignment: Alignment.center,
            // decoration: const BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(20)),
            //   color: Colors.white,
            //   boxShadow: [
            //     BoxShadow(
            //       color: Color(0xFFD0D0D0),
            //       blurRadius: 5.0, // soften the shadow
            //       spreadRadius: 1.0, //extend the shadow
            //     )
            //   ],
            // ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AppNetworkImage(
                  widget.element.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.center,
            height: 45,
            decoration: BoxDecoration(
              color: widget.element.isSelected ?? false
                  ? appPrimaryBlueColor.withOpacity(0.7)
                  : Colors.black.withOpacity(0.7),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Text(
              widget.element.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
        Visibility(
          visible: widget.element.isSelected ?? false,
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 0, top: 0),
              child: Transform.translate(
                offset: const Offset(7, -1),
                child: SvgPicture.asset(
                  'assets/images/ic_green_check.svg',
                  width: 25,
                  height: 25,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class AppBarBackButton extends StatefulWidget {
//   final Function() onBackPressed;
//   const AppBarBackButton({super.key, required this.onBackPressed});

//   @override
//   State<AppBarBackButton> createState() => _AppBarBackButtonState();
// }

// class _AppBarBackButtonState extends State<AppBarBackButton> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: widget.onBackPressed,
//         borderRadius: BorderRadius.circular(10),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Row(children: [
//             SvgPicture.asset('assets/images/ic_appBar_back_arrow.svg.svg'),
//             const Text(
//               'Back',
//               style: TextStyle(color: Colors.black),
//             )
//           ]),
//         ));
//   }
// }
