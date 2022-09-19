import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/restourant.dart';

class AsynData {
  static Future<ResponseRestourant> getRestaurans() async {
    var dataRestaurants =
        await rootBundle.loadString('assets/data/local_restourant.json');
    Map<String, dynamic> dataMap = jsonDecode(dataRestaurants);
    var resposeRestourant = ResponseRestourant.fromMap(dataMap);
    return resposeRestourant;
  }
}
