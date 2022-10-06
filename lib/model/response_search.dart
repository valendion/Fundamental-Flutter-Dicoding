import 'restourant_model.dart';

class ResponseSearchRestourant {
  bool? error;
  int? founded;
  String? errorMessage;
  List<Restaurants>? restaurants;

  ResponseSearchRestourant(
      {this.error, this.founded, this.restaurants, this.errorMessage});

  ResponseSearchRestourant.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    founded = json['founded'];
    if (json['restaurants'] != null) {
      restaurants = <Restaurants>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(Restaurants.fromJson(v));
      });
    }
  }

  factory ResponseSearchRestourant.withError(String error) {
    return ResponseSearchRestourant(
        error: false, restaurants: [], errorMessage: error);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['founded'] = founded;
    if (restaurants != null) {
      data['restaurants'] = restaurants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
