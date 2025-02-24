import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/doctor/doctors.dart';
import 'package:well_path/features/settings/ui/settings_view.dart';

import '../../../../corewidgets/app_bar_back_button.dart';
import '../../../../corewidgets/app_network_image.dart';
import '../../../../corewidgets/draggable_gridview.dart';
import '../../../../corewidgets/global_keys.dart';
import '../../../../corewidgets/skip_action_app_bar_button.dart';
import '../../../../corewidgets/well_path_app_bar.dart';
import '../../../../corewidgets/wellpathbutton.dart';
import '../../../../data/local/auth_store.dart';
import '../../../../extensions/extensions.dart';
import '../../../../helper/mixins/loading_mixin.dart';
import '../../../../helper/mixins/show_message_mixin.dart';
import '../../../homescreens/home/ui/home_page.dart';
import '../cubit/lifestyle_element_cubit.dart';
import '../cubit/lifestyle_element_navigation_enums.dart';
import '../models/lifestyle_element_state.dart';
import '../network/response/selected_lifestyle_elements_api_responses/get_selected_lifestyle_elements_response.dart';

class SelectedLifeStyleElementsWidget extends StatefulWidget {
  final AuthStore? authStore;
  static const route = '/selected_lifestyle_elements';

  const SelectedLifeStyleElementsWidget({
    super.key,
    this.authStore,
  });

  @override
  State<SelectedLifeStyleElementsWidget> createState() => _SelectedLifeStyleElementsWidgetState();
}

class _SelectedLifeStyleElementsWidgetState extends State<SelectedLifeStyleElementsWidget> with Loading, Message {
  late final _cubit = context.read<LifestyleElementCubit>();
  @override
  void initState() {
    super.initState();
    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    _cubit.getSelectedLifestyleElements();
  }

  void _initNavigationListener() {
    _cubit.navigation.listen((event) {
      switch (event) {
        case LifestyleElementsNavigation.home:
          _navigateToHome();
          break;
        case LifestyleElementsNavigation.settings:
          _navigateToSettings();
          break;
        default:
          break;
      }
    });
  }

  void _navigateToHome() {
    context.navigator.pushNamed(HomePage.route);
  }

  void _navigateToSettings() {
    navigatorKey.currentState
      ?..pop()
      ..pop()
      ..pop()
      ..pop()
      ..pop()
      ..pop()
      ..pop();
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
                  // Navigator.of(context).pushNamed(HomePage.route);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorPage(),
                    ),
                  );
                })
              ]),
          body: Stack(
            children: [
              SafeArea(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Step 8 of 8', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: const Color(0xff4AB7C3))),
                      Text('Select a priority for lifestyle.', style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 16),
                      Text('Press and hold to drag the elements', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black)),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.center,
                        child: Text('Lifestyle Selected', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: const Color(0xff4AB7C3))),
                      ),
                      const SizedBox(height: 6),
                      Expanded(
                        child: _cubit.state.selectedLifestyleItem.isEmpty
                            ? const SizedBox.shrink()
                            : DraggableGridView(
                                items: _cubit.state.selectedLifestyleItem,
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: WellPathButton(
                          buttonText: 'Save Changes',
                          onPressed: () async {
                            final isFromSettings = await widget.authStore!.getIsComingFromSettings();
                            _cubit.changeElementsPriority(isFromSettings ?? false, context);
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
}

class SelectedLifestyleElementGridTile extends StatefulWidget {
  final SelectedLifestyleItem element;
  const SelectedLifestyleElementGridTile({super.key, required this.element});

  @override
  State<SelectedLifestyleElementGridTile> createState() => _SelectedLifestyleElementGridTileState();
}

class _SelectedLifestyleElementGridTileState extends State<SelectedLifestyleElementGridTile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFD0D0D0),
                  blurRadius: 5.0, // soften the shadow
                  spreadRadius: 1.0, //extend the shadow
                )
              ],
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AppNetworkImage(
                  widget.element.lifestyleList.coverImageUrl,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xff4AB7C3).withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Text(
                widget.element.lifestyleList.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 0, top: 0),
              child: Transform.translate(
                  offset: const Offset(7, -7),
                  child: SvgPicture.asset(
                    'assets/images/ic_green_check.svg',
                    width: 25,
                    height: 25,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
