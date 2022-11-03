import 'dart:isolate';
import 'dart:ui';

import 'package:fundamental_flutter/data/repository/restourant_repository.dart';
import 'package:fundamental_flutter/utils/notification_helper.dart';

import '../main.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future<void> callback() async {
    final repositoryRestourant = RestourantRepository();
    final NotificationHelper notificationHelper = NotificationHelper();
    var result = await repositoryRestourant.getAllRestourant();

    await notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, result.restaurants ?? []);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
