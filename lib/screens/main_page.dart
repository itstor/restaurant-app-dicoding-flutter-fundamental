import 'package:flutter/material.dart';
import 'package:flutter_fundamental_1/screens/empty_page.dart';
import 'package:flutter_fundamental_1/screens/restaurantlist_page.dart';
import 'package:flutter_fundamental_1/widgets/bottom_navigation_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationWidget(updatePageFunc: updatePage),
        body: IndexedStack(
          index: _index,
          children: [
            RestaurantListPage(),
            const EmptyPage(title: 'Location'),
            const EmptyPage(title: 'Favorute'),
            const EmptyPage(title: 'Notification'),
          ],
        ));
  }

  updatePage(int index) {
    setState(() {
      _index = index;
    });
  }
}
