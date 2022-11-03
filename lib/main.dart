import 'dart:io';

import 'package:flutter/material.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fundamental_flutter/style/theme.dart';
import 'package:fundamental_flutter/utils/navigation.dart';
import 'package:fundamental_flutter/utils/notification_helper.dart';
import 'package:fundamental_flutter/utils/route.dart';
import 'package:fundamental_flutter/utils/text_string.dart';
import 'package:fundamental_flutter/utils/background_service.dart';

import 'style/color_theme.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService service = BackgroundService();

  service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fundamental Flutter',
      theme: ThemeData(
        primarySwatch: ColorPalette.blackToLight(),
        textTheme: textTheme,
      ),
      navigatorKey: navigatorKey,
      initialRoute: splashPage,
      routes: routes,
    );
  }
}
