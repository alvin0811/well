import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:well_path/corewidgets/global_keys.dart';
import 'package:well_path/helper/enum/global_messages_enums.dart';
import 'package:well_path/helper/helpers.dart';
import 'package:well_path/localization/app_localization.dart';
import 'package:well_path/routes/route_generator.dart';
import 'package:well_path/theme/theme.dart';
import 'package:well_path/widgets/internet_connection.dart';

final globalMessageController = SController<GlobalMessage>.broadcast();
Stream<GlobalMessage> get globalMessage => globalMessageController.stream;

class BodyVitalApp extends StatefulWidget {
  const BodyVitalApp({Key? key, this.appParams}) : super(key: key);

  final AppParams? appParams;

  @override
  State<BodyVitalApp> createState() => _BodyVitalAppState();
}

class _BodyVitalAppState extends State<BodyVitalApp> {
  final _connectivity = Connectivity();
  late final StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _initConnectivity();
  }

  void _initConnectivity() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        _checkConnectivity();
        _connectivitySubscription = _connectivity.onConnectivityChanged
            .listen(_onConnectionStatusChanged);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      navigatorKey: navigatorKey,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: BotToastInit(),
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      theme: lightTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
      ],
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: widget.appParams!.route,
    );
  }

  Future<void> _checkConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint(e.stacktrace);
      return;
    }
    _onConnectionStatusChanged(result);
  }

  void _onConnectionStatusChanged(ConnectivityResult result) {
    try {
      switch (result) {
        case ConnectivityResult.mobile:
        case ConnectivityResult.wifi:
          InternetConnection.show(true);
          InternetConnection.showBanner = false;
          break;
        default:
          InternetConnection.showBanner = true;
          InternetConnection.show(false);
          break;
      }
    } catch (_) {}
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}

class AppParams {
  AppParams({required this.route});

  final String route;
}
