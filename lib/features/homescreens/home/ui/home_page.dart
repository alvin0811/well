import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_path/app.dart';
import 'package:well_path/corewidgets/global_keys.dart';
import 'package:well_path/features/homescreens/home/cubit/home_cubit.dart';
import 'package:well_path/features/homescreens/home/state/homestate.dart';
import 'package:well_path/features/notification/ui/notification_view.dart';
import 'package:well_path/features/onboarding/bmi_calculations/ui/bmi_calculation_page.dart';
import 'package:well_path/features/onboarding/demographics/ui/demographic_page.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';
import 'package:well_path/main.dart';
import 'package:well_path/routes/dash_diet_route_generator.dart';
import 'package:well_path/routes/healthy_living_route_generator.dart';
import 'package:well_path/routes/home_route_generator.dart';
import 'package:well_path/routes/trends_route_generator.dart';

class HomePage extends StatefulWidget {
  static const route = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loading, Message {
  int selectedIndex = 0;
  late final _cubit = context.read<HomeCubit>();
  bool _resolved = false;
  String? initialMessage;

  final List<IconData> icons = [
    Icons.add,
    Icons.abc,
    Icons.abc_outlined,
    Icons.ac_unit_sharp
  ];

  final List<String> bottomNavBarImages = [
    "assets/images/ic_unselected_home.svg",
    "assets/images/ic_unselected_trend.svg",
    "assets/images/ic_unselected_dashdiet.svg",
    "assets/images/ic_unselected_healthyliving.svg"
  ];

  final List<String> bottomNavBarTitles = [
    "  Home  ",
    "  Trends  ",
    "Weight Loss",
    "Healthy living"
  ];

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then(
          (value) => setState(
            () {
              _resolved = true;
              initialMessage = value?.data.toString();
            },
          ),
        );

    FirebaseMessaging.onMessage.listen(showFlutterNotification);
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      navigatorKey.currentState?.pushNamed(NotificationPage.route);
    });

    _initNavigationListener();
    _initOnBoardingCheckListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    _cubit.getUserFromAuthStore();
    _cubit.getUserDetails();
  }

  void _initOnBoardingCheckListener() {
    _cubit.isFirstStepCompleted.listen((event) {
      if (event == false) {
        navigatorKey.currentState?.pushNamed(DemographicPage.route);
      }
    });
    _cubit.isSecondStepCompleted.listen((event) {
      if (event == false) {
        navigatorKey.currentState?.pushNamed(BmiCalculationPage.route);
      }
    });
  }

  void _initNavigationListener() {}
  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      BotToast.showText(text: "Press again to exit application");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: WillPopScope(
              onWillPop: onWillPop,
              child: getStateWidget(state.value.tabValue)),
          bottomNavigationBar: BottomBar(
            icons: icons,
            bottomNavBarTitles: bottomNavBarTitles,
            bottomNavBarImages: bottomNavBarImages,
            selectedIndex: state.value.tabValue,
            onSonChanged: (index) {
              _cubit.updateTabs(index);
            },
          ),
        );
      },
    );
  }
}

Widget getStateWidget(int state) {
  switch (state) {
    case 0:
      return Navigator(
        key: homeNavigatorKey,
        initialRoute: "/",
        onGenerateRoute: HomeRouteGenerator.generateRoute,
      );
    case 1:
      return Navigator(
        key: trendsNavigatorKey,
        initialRoute: "/",
        onGenerateRoute: TrendsRouteGenerator.generateRoute,
      );
    case 2:
      return Navigator(
        key: weightLossNavigatorKey,
        initialRoute: "/",
        onGenerateRoute: WeightLossRouteGenerator.generateRoute,
      );
    case 3:
      return Navigator(
        key: healthyLivingNavigatorKey,
        initialRoute: "/",
        onGenerateRoute: HealthyLivingRouteGenerator.generateRoute,
      );
    default:
      return const Text('Invalid state');
  }
}

typedef IntCallback = void Function(int id);

class BottomBar extends StatefulWidget {
  final List<IconData> icons;
  final List<String> bottomNavBarImages;
  final List<String> bottomNavBarTitles;
  int selectedIndex;

  final IntCallback onSonChanged;

  BottomBar(
      {super.key,
      required this.icons,
      required this.bottomNavBarImages,
      required this.bottomNavBarTitles,
      required this.selectedIndex,
      required this.onSonChanged});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 72,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            widget.icons.length,
            (index) => GestureDetector(
              onTap: () {
                widget.onSonChanged(index);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    widget.bottomNavBarImages[index],
                    colorFilter: ColorFilter.mode(
                        widget.selectedIndex == index
                            ? const Color(0xFF4AB7C3)
                            : Colors.black,
                        BlendMode.srcIn),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.selectedIndex == index
                        ? "•"
                        : widget.bottomNavBarTitles[index],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: widget.selectedIndex == index
                            ? const Color(0xFF4AB7C3)
                            : Colors.black,
                        fontSize: 10),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
