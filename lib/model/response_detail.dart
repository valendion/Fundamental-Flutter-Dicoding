import 'drink.dart';
import 'food.dart';

class ResponseDetailRestourant {
  bool? error;
  String? message;
  String? errorMessage;
  Restaurant? restaurant;

  ResponseDetailRestourant(
      {this.error, this.message, this.restaurant, this.errorMessage});

  ResponseDetailRestourant.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    restaurant = json['restaurant'] != null
        ? Restaurant.fromJson(json['restaurant'])
        : null;
  }

  factory ResponseDetailRestourant.withError(String error) {
    return ResponseDetailRestourant(
        error: false,
        message: '',
        restaurant: Restaurant(),
        errorMessage: error);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    if (restaurant != null) {
      data['restaurant'] = restaurant!.toJson();
    }
    return data;
  }
}

class Restaurant {
  String? id;
  String? name;
  String? description;
  String? city;
  String? address;
  String? pictureId;
  List<Categories>? categories;
  Menus? menus;
  num? rating;
  List<CustomerReviews>? customerReviews;

  Restaurant(
      {this.id,
      this.name,
      this.description,
      this.city,
      this.address,
      this.pictureId,
      this.categories,
      this.menus,
      this.rating,
      this.customerReviews});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    city = json['city'];
    address = json['address'];
    pictureId = json['pictureId'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    menus = json['menus'] != null ? Menus.fromJson(json['menus']) : null;
    rating = json['rating'];
    if (json['customerReviews'] != null) {
      customerReviews = <CustomerReviews>[];
      json['customerReviews'].forEach((v) {
        customerReviews!.add(CustomerReviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['city'] = city;
    data['address'] = address;
    data['pictureId'] = pictureId;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (menus != null) {
      data['menus'] = menus!.toJson();
    }
    data['rating'] = rating;
    if (customerReviews != null) {
      data['customerReviews'] =
          customerReviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? name;

  Categories({this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Menus {
  List<Food>? foods;
  List<Drink>? drinks;

  Menus({this.foods, this.drinks});

  Menus.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      foods = <Food>[];
      json['foods'].forEach((v) {
        foods!.add(Food.fromMap(v));
      });
    }
    if (json['drinks'] != null) {
      drinks = <Drink>[];
      json['drinks'].forEach((v) {
        drinks!.add(Drink.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (foods != null) {
      data['foods'] = foods!.map((v) => v.toMap()).toList();
    }
    if (drinks != null) {
      data['drinks'] = drinks!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class CustomerReviews {
  String? name;
  String? review;
  String? date;

  CustomerReviews({this.name, this.review, this.date});

  CustomerReviews.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    review = json['review'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['review'] = review;
    data['date'] = date;
    return data;
  }
}
