import 'package:flutter/material.dart';
import 'package:fundamental_flutter/style/theme.dart';
import 'package:lottie/lottie.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Route route = MaterialPageRoute(builder: (context) => const HomePage());
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    });
    super.initState();
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
