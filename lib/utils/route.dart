import 'package:flutter/material.dart';
import 'package:fundamental_flutter/pages/detail_page.dart';
import 'package:fundamental_flutter/pages/search_page.dart';
import 'package:fundamental_flutter/pages/splash_page.dart';
import 'package:fundamental_flutter/utils/text_string.dart';

import '../pages/home_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  splashPage: (context) => const SplashPage(),
  homePage: (context) => const HomePage(),
  detailPage: (context) => const DetailPage(),
  searchPage: (context) => const SearchPage(),
};
