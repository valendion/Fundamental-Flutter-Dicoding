import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fundamental_flutter/utils/navigation.dart';
import 'package:rxdart/rxdart.dart';

import '../model/restourant_model.dart';

final selectNotificationSubject = BehaviorSubject<String>();

// final didReceiveLocalNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static const _channelId = '01';
  static const _channelName = 'channel_01';
  static const _channelDesc = 'dion channel';
  static NotificationHelper? _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse details) async {
      final payload = details.payload;
      if (payload != null) {
        print('notification payload: ' + payload);
      }
      selectNotificationSubject.add(payload ?? '');
    });
  }

  Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      List<Restaurants> resourants) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        _channelId, _channelName,
        channelDescription: _channelDesc,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        styleInformation: DefaultStyleInformation(true, true));

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    var randomIndex = Random().nextInt(resourants.length);
    var randomRestourant = resourants[randomIndex];
    var title = '<b>${randomRestourant.name}</b>';
    var desc = 'Recomendation Restourant For You';

    await flutterLocalNotificationsPlugin.show(
        0, title, desc, platformChannelSpecifics,
        payload: randomRestourant.id);
  }

  void configureSelectNotification(String route) {
    selectNotificationSubject.stream.listen((String payload) async {
      Navigation.intentWithData(route, payload);
    });
  }
}
