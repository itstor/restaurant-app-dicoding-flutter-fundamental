import 'package:flutter_fundamental_1/models/restaurants_model.dart';

class RestaurantList {
  List<Restaurants>? restaurants;

  RestaurantList({this.restaurants});

  RestaurantList.fromJson(Map<String, dynamic> json) {
    if (json['restaurants'] != null) {
      restaurants = <Restaurants>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(Restaurants.fromJson(v));
      });
    }
  }
}
