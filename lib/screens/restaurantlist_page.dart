import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental_1/common/constants.dart';
import 'package:flutter_fundamental_1/models/category_model.dart';
import 'package:flutter_fundamental_1/models/restaurantlist_model.dart';
import 'package:flutter_fundamental_1/models/restaurants_model.dart';
import 'package:flutter_fundamental_1/screens/restaurant_detail_page.dart';
import 'package:flutter_fundamental_1/widgets/category_list_widget.dart';
import 'package:flutter_fundamental_1/widgets/curved_appbar_scaffold.dart';
import 'package:flutter_fundamental_1/widgets/featured_card_widget.dart';
import 'package:flutter_fundamental_1/widgets/neumorphic_single_button_widget.dart';
import 'package:flutter_fundamental_1/widgets/small_restaurant_card_wiidget.dart';

class RestaurantListPage extends StatelessWidget {
  final categoryData = CategoryData.data;
  RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedAppBarScaffold(
      appBarTitle: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Your location',
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                ),
            children: [
              TextSpan(
                text: '\nSoekarno-Hatta St.',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.white, fontSize: 15, height: 1.5),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.amber[800],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  bottom: 20,
                ),
                child: Text(
                  'What would you like to eat?',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
                child: _buildSearchBar(context),
              ),
              SizedBox(
                height: 98,
                child: CategoryListWidget(categoryData: categoryData),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
                child: Text(
                  'Featured Restaurants',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              _buildFeaturedRestaurants(context),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  'Restaurant Near You',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const SizedBox(height: 15),
              _buildRestaurantList(context),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<String> _buildFeaturedRestaurants(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/data/local_restaurants.json'),
      builder: (context, snapshot) {
        final List<Restaurants>? data = _parseRestaurantList(snapshot.data);
        return SizedBox(
          height: 235,
          child: ListView.builder(
            itemCount: data!.length,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: index != 1 ? 25.0 : 15.0),
                child: FeaturedCardWidget(
                  title: data[index].name!,
                  image: NetworkImage(data[index].pictureId!),
                  location: data[index].city!,
                  rating: data[index].rating!,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Not implemented yet'),
                      ),
                    );
                  },
                  tags: data[index].tags ?? [],
                ),
              );
            },
          ),
        );
      },
    );
  }

  FutureBuilder<String> _buildRestaurantList(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/data/local_restaurants.json'),
      builder: (context, snapshot) {
        final List<Restaurants> data =
            _parseRestaurantList(snapshot.data).reversed.toList();
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          width: double.infinity,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.6,
              maxCrossAxisExtent: 250,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return SmallRestaurantCardWidget(
                title: data[index].name!,
                image: NetworkImage(data[index].pictureId!),
                id: data[index].id!,
                location: data[index].city!,
                rating: data[index].rating!,
                onTap: () {
                  Navigator.pushNamed(context, RestaurantDetailPage.routeName,
                      arguments: data[index]);
                },
              );
            },
          ),
        );
      },
    );
  }

  List<Restaurants> _parseRestaurantList(String? json) {
    if (json == null) {
      return [];
    }
    final Map<String, dynamic> parsed = jsonDecode(json);

    return RestaurantList.fromJson(parsed).restaurants!;
  }

  SizedBox _buildSearchBar(BuildContext context) {
    return SizedBox(
      height: 51,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a restaurant',
                hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: kGrayColor[100],
                      fontSize: 14,
                    ),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color(0xFFFCFCFD),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFEFEFEF),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColorYellow[50]!,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(width: 18),
          Container(
            width: 51,
            height: 51,
            clipBehavior: Clip.none,
            child: NeumorphicSingleButtonWidget(
              child: Icon(
                Icons.filter_list_rounded,
                color: kPrimaryColorOrange[100],
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Not implemented yet'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
