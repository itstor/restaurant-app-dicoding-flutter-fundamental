import 'package:flutter_fundamental_1/models/menu_model.dart';

class Restaurants {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;
  List<String>? tags;
  Menus? menus;

  Restaurants(
      {this.id,
      this.name,
      this.description,
      this.pictureId,
      this.city,
      this.rating,
      this.tags,
      this.menus});

  Restaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = json['rating']?.toDouble();
    menus = json['menus'] != null ? Menus.fromJson(json['menus']) : null;

    if (json['tags'] != null) {
      tags = <String>[];
      json['tags'].forEach((v) {
        tags!.add(v);
      });
    }
  }
}
