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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant!.toJson();
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
  double? rating;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['city'] = this.city;
    data['address'] = this.address;
    data['pictureId'] = this.pictureId;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.menus != null) {
      data['menus'] = this.menus!.toJson();
    }
    data['rating'] = this.rating;
    if (this.customerReviews != null) {
      data['customerReviews'] =
          this.customerReviews!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.foods != null) {
      data['foods'] = this.foods!.map((v) => v.toMap()).toList();
    }
    if (this.drinks != null) {
      data['drinks'] = this.drinks!.map((v) => v.toMap()).toList();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['review'] = this.review;
    data['date'] = this.date;
    return data;
  }
}
