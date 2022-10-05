import 'package:dio/dio.dart';
import 'package:fundamental_flutter/model/response_detail.dart';
import 'package:fundamental_flutter/model/response_restourant.dart';
import 'package:fundamental_flutter/model/response_search.dart';
import 'package:fundamental_flutter/utils/constans.dart';

class ServiceRestourant {
  static Future<ResponseRestourant> getRestourants() async {
    ResponseRestourant? responseRestourant;
    try {
      var response =
          await Dio().get(Constans.baseUrl + Constans.restourantsUrl);
      responseRestourant = ResponseRestourant.fromJson(response.data);
    } on DioError catch (e) {
      responseRestourant = ResponseRestourant.withError(e.message);
    }
    return responseRestourant;
  }

  static Future<ResponseDetailRestourant> getDetailRestourant(String id) async {
    ResponseDetailRestourant? responseDetailRestourant;
    try {
      var response =
          await Dio().get(Constans.baseUrl + Constans.restourantDetailUrl + id);
      responseDetailRestourant =
          ResponseDetailRestourant.fromJson(response.data);
    } on DioError catch (e) {
      responseDetailRestourant = ResponseDetailRestourant.withError(e.message);
    }
    return responseDetailRestourant;
  }

  static Future<ResponseSearchRestourant> getSearchRestourant(
      String name) async {
    ResponseSearchRestourant? responseSearchRestourant;
    try {
      var response = await Dio().get(
          Constans.baseUrl + Constans.restourantSearchUrl,
          queryParameters: {'q': name});
      responseSearchRestourant =
          ResponseSearchRestourant.fromJson(response.data);
    } on DioError catch (e) {
      responseSearchRestourant = ResponseSearchRestourant.withError(e.message);
    }
    return responseSearchRestourant;
  }
}
