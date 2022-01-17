import 'package:flutter/cupertino.dart';
import 'package:flutter_fundamental_1/models/restaurants_model.dart';
import 'package:flutter_fundamental_1/screens/restaurant_detail_page.dart';

Map<String, Widget Function(BuildContext)> router = {
  RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
      restaurantData:
          ModalRoute.of(context)?.settings.arguments as Restaurants),
};
