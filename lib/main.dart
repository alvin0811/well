import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:well_path/app.dart';
import 'package:well_path/configs/configs_development.dart';
import 'package:well_path/configs/configs_production.dart';
import 'package:well_path/configs/configs_staging.dart';
import 'package:well_path/corewidgets/global_keys.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/di/injectable.dart';
import 'package:well_path/di/environments.dart' as env;
import 'package:well_path/fcm/firebase_api.dart';
import 'package:well_path/features/homescreens/home/ui/home_page.dart';
import 'package:well_path/features/notification/ui/notification_view.dart';
import 'package:well_path/features/splash/splash_screen.dart';
import 'di/locator/service_locator.dart';

const keyEnvironment = 'env';

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'notifications', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.', // description
    importance: Importance.high,
  );
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  const initializationSettingsAndroid = AndroidInitializationSettings('ic_notification');
  const initializationSettingsIOS = DarwinInitializationSettings();
  const initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
  final String? payload = notificationResponse.payload;
  if (notificationResponse.payload != null) {
    debugPrint('notification payload: $payload');
  }
  navigatorKey.currentState?.pushNamed(NotificationPage.route);
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: 'launch_background',
        ),
      ),
    );
  }
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("Title ${message.notification?.title}");
  debugPrint("Body ${message.notification?.body}");
  debugPrint("Payload ${message.data}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _configureEnvironment(const String.fromEnvironment(keyEnvironment));
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Future.delayed(const Duration(seconds: 1));
  final fcmToken = await FirebaseMessaging.instance.getToken();
  debugPrint(fcmToken.toString());
  if (!kIsWeb) {
    await setupFlutterNotifications();
  }
  runApp(BodyVitalApp(appParams: await _initAppState()));
}

void _configureEnvironment(String environment) {
  const development = 'dev';
  const demo = 'demo';
  const production = 'prod';
  switch (environment) {
    case development:
      configureDependencies(env.dev);
      setupLocator(ConfigsDevelopment());
      break;
    case demo:
      configureDependencies(env.demo);
      setupLocator(ConfigsStaging());
      break;
    case production:
      configureDependencies(env.prod);
      setupLocator(ConfigsProduction());
      break;
    default:
      configureDependencies(env.dev);
      setupLocator(ConfigsDevelopment());
  }
}

Future<AppParams> _initAppState() async {
  final authStore = AuthStore();

  if (!(await authStore.loggedIn())) {
    return AppParams(route: SplashScreen.route);
  } else {
    return AppParams(route: HomePage.route);
  }
}
