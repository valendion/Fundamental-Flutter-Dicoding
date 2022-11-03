import 'package:flutter/material.dart';
import 'package:fundamental_flutter/style/theme.dart';
import 'package:lottie/lottie.dart';

import '../utils/notification_helper.dart';
import '../utils/text_string.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final NotificationHelper _notificationHelper = NotificationHelper();
  @override
  void initState() {
    _notificationHelper.configureSelectNotification(detailPage);

    Future.delayed(const Duration(seconds: 3), () {
      Route route = MaterialPageRoute(builder: (context) => const HomePage());
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    });

    super.initState();
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 250,
              width: 250,
              child: Lottie.asset('assets/img/animation.json')),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Restourant App',
            style: Theme.of(context).textTheme.headline6?.merge(title),
          ),
        ],
      )),
    );
  }
}
