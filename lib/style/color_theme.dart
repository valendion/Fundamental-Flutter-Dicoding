import 'package:flutter/material.dart';

Color blackPrimary = const Color(0xff141212);
Color greyPrimary = const Color(0xff8d8b8a);
Color white = const Color.fromARGB(255, 255, 255, 255);

class ColorPalette {
  static MaterialColor blackToLight() {
    final Map<int, Color> colorGradiant = {
      50: const Color.fromRGBO(20, 18, 18, .1),
      100: const Color.fromRGBO(20, 18, 18, .2),
      200: const Color.fromRGBO(20, 18, 18, .3),
      300: const Color.fromRGBO(20, 18, 18, .4),
      400: const Color.fromRGBO(20, 18, 18, .5),
      500: const Color.fromRGBO(20, 18, 18, .6),
      600: const Color.fromRGBO(20, 18, 18, .7),
      700: const Color.fromRGBO(20, 18, 18, .8),
      800: const Color.fromRGBO(20, 18, 18, .9),
      900: const Color.fromRGBO(20, 18, 18, .1),
    };
    return MaterialColor(0xff141212, colorGradiant);
  }
}
