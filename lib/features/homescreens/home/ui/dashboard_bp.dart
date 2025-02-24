import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_path/common/constants.dart';
import 'package:well_path/corewidgets/app_bar_profile_widget.dart';
import 'package:well_path/corewidgets/global_keys.dart';
import 'package:well_path/corewidgets/notification_action_app_bar_button.dart';
import 'package:well_path/corewidgets/settings_action_app_bar_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/features/homescreens/home/bp_record/ui/bp_record_page.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/di/injectable.dart';
import 'package:well_path/features/homescreens/home/cubit/home_cubit.dart';
import 'package:well_path/features/homescreens/home/state/homestate.dart';
import 'package:well_path/features/settings/weightlosstracker/cubit/weight_loss_cubit.dart';
import 'package:well_path/features/settings/weightlosstracker/weight_loss_settings_page.dart';

import '../bp_tutorials/bp_tutorial_page.dart';
import '../daily_facts/ui/daily_facts_main_page.dart';

class DashBoardBp extends StatefulWidget {
  const DashBoardBp({Key? key}) : super(key: key);

  @override
  State<DashBoardBp> createState() => _DashBoardBpState();
}

class _DashBoardBpState extends State<DashBoardBp> {
  int _value = 0;
  final authStore = AuthStore();
late final _cubitHome = context.read<HomeCubit>();
  String name = '';
  String image = '';

  final _controller = PageController(
    initialPage: 0,
  );

  changeTabs(newNumber) {
    setState(() {
      _value = newNumber;
    });
  }

  @override
  void initState() {
    super.initState();
    getIt<AuthStore>().setIsComingFromSettings(false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: WellPathAppBar(
            leading: ProfileViewWidget(
              name: state.fullName,
              image: state.profilePictureId,
            ),
            isProfileImageVisible: true,
            actions: [
              NotificationActionButton(onNotificationPressed: () {
                navigateToNotification();
              }),
              SettingsActionButton(onSettingPressed: () async {
                var received = await navigatorKey.currentState?.pushNamed('/settings');
                _cubitHome.getUserFromAuthStore();   
              })
            ],
          ),
          body: Stack(
            children: [
              SafeArea(
                child: getStateWidget(_value, changeTabs),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

Widget getStateWidget(int state, Function(int newNumber) changeTabs) {
  switch (state) {
    case 0:
      return const BPRecordPage();
    case 1:
      return BPTutorialPage(
        state,
        changeTabs: changeTabs,
      );
    case 2:
      return BlocProvider(
        create: (context) => getIt<WeightLossSettingCubit>(),
        child: const WeightLossSettingPage(),
      );
    case 3:
      return const DailyFactsPage();
    default:
      return const Text('2');
  }
}

class BPRadioTile<T> extends StatefulWidget {
  final T value;
  final T groupValue;
  final String leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;
  final String imagePath, imageName;

  const BPRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    this.title,
    required this.imagePath,
    required this.imageName,
  });

  @override
  State<BPRadioTile<T>> createState() => _BPRadioTileState<T>();
}

class _BPRadioTileState<T> extends State<BPRadioTile<T>> {
  @override
  Widget build(BuildContext context) {
    final title = widget.title;
    return GestureDetector(
      onTap: () => widget.onChanged(widget.value),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          child: _customRadioButton,
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = widget.value == widget.groupValue;
    return Card(
      color: isSelected ? const Color(0xFF4AB7C3) : null,
      margin: const EdgeInsets.only(right: 2, top: 20, bottom: 15, left: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      shadowColor: Colors.black,
      child: SizedBox(
        height: 102,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              widget.imagePath,
              colorFilter: isSelected
                  ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                  : const ColorFilter.mode(Color(0xFFA9A9A9), BlendMode.srcIn),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.imageName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12, color: isSelected ? Colors.white : null),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
