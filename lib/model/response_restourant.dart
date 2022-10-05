import 'package:fundamental_flutter/model/restourant_model.dart';

class ResponseRestourant {
  bool? error;
  String? errorMessage;
  String? message;
  int? count;
  List<Restaurants>? restaurants;

  ResponseRestourant(
      {this.error,
      this.message,
      this.count,
      this.restaurants,
      this.errorMessage = ''});

  ResponseRestourant.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    count = json['count'];
    if (json['restaurants'] != null) {
      restaurants = <Restaurants>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(Restaurants.fromJson(v));
      });
    }
  }

  factory ResponseRestourant.withError(String error) {
    return ResponseRestourant(
        count: 0,
        error: false,
        message: '',
        restaurants: [],
        errorMessage: error);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['error'] = error;
    data['message'] = message;
    data['count'] = count;
    if (restaurants != null) {
      data['restaurants'] = restaurants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
