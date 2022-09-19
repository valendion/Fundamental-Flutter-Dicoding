import 'package:flutter/material.dart';
import 'package:fundamental_flutter/style/theme.dart';
import 'package:fundamental_flutter/utils/route.dart';
import 'package:fundamental_flutter/utils/text_string.dart';

import 'style/color_theme.dart';

void main() {
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
      initialRoute: splashPage,
      routes: routes,
    );
  }
}
