import 'package:fundamental_flutter/data/network/service_restorant.dart';
import 'package:fundamental_flutter/model/response_detail.dart';
import 'package:fundamental_flutter/model/response_restourant.dart';
import 'package:fundamental_flutter/model/response_search.dart';

class RestourantRepository {
  Future<ResponseRestourant> getAllRestourant() {
    return ServiceRestourant.getRestourants();
  }

  Future<ResponseDetailRestourant> getDetailRestourant(String id) {
    return ServiceRestourant.getDetailRestourant(id);
  }

  Future<ResponseSearchRestourant> getSearchRestourant(String name) {
    return ServiceRestourant.getSearchRestourant(name);
  }
}
