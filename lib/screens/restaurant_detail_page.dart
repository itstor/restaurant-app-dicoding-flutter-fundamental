import 'package:flutter/material.dart';
import 'package:flutter_fundamental_1/common/constants.dart';
import 'package:flutter_fundamental_1/models/restaurants_model.dart';
import 'package:flutter_fundamental_1/widgets/menu_card_widget.dart';
import 'package:flutter_fundamental_1/widgets/neumorphic_single_button_widget.dart';

class RestaurantDetailPage extends StatefulWidget {
  static const String routeName = '/restaurant-detail';

  final Restaurants restaurantData;
  const RestaurantDetailPage({Key? key, required this.restaurantData})
      : super(key: key);

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  late ScrollController _scrollController;
  double _backButtonOpacity = 0;
  bool _isBackButtonVisible = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      // print(_scrollController.offset);
      if (230 > _scrollController.offset && _scrollController.offset > 150) {
        setState(() {
          _backButtonOpacity = _scrollController.offset / 230;
          _isBackButtonVisible = true;
        });
      } else if (_scrollController.offset > 230 && _backButtonOpacity != 1) {
        setState(() {
          _backButtonOpacity = 1;
          _isBackButtonVisible = true;
        });
      } else if (_scrollController.offset < 150 && _backButtonOpacity != 0) {
        setState(() {
          _backButtonOpacity = 0;
          _isBackButtonVisible = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white.withAlpha(230),
              elevation: 0,
              expandedHeight: 250,
              leading: Visibility(
                visible: _isBackButtonVisible,
                child: BackButton(
                  onPressed: () => Navigator.pop(context),
                  color: Colors.black.withOpacity(_backButtonOpacity),
                ),
              ),
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.restaurantData.name!,
                    style: TextStyle(
                        color: kTyphographyColor[100]!
                            .withOpacity(_backButtonOpacity))),
                collapseMode: CollapseMode.pin,
                background: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Hero(
                          tag: widget.restaurantData.id!,
                          child: Image.network(
                            widget.restaurantData.pictureId!,
                            fit: BoxFit.cover,
                            height: 206,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: SizedBox(
                          height: 38,
                          width: 38,
                          child: NeumorphicSingleButtonWidget(
                            onTap: () => Navigator.pop(context),
                            borderRadius: 12,
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 15,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // const SizedBox(height: 22),
                    Text(
                      widget.restaurantData.name ?? 'null',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 28),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color:
                                    kPrimaryColorYellow[20]!.withOpacity(0.6),
                                spreadRadius: 0.0,
                                blurRadius: 10.0,
                                offset: const Offset(0.0, 4.0))
                          ]),
                          child: Icon(
                            Icons.star,
                            size: 22,
                            color: kPrimaryColorYellow[100],
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.restaurantData.rating.toString(),
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See review',
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: kPrimaryColorOrange[100],
                                      decoration: TextDecoration.underline,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.restaurantData.description ?? 'null',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            height: 1.2,
                            color: kTyphographyColor[50],
                          ),
                    ),
                    const SizedBox(height: 22),
                    Text(
                      'Menu',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Foods',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var data = widget.restaurantData.menus!.foods;
                    return MenuCardWidget(
                      title: data?[index].name ?? 'null',
                      onTap: () {},
                    );
                  },
                  childCount: widget.restaurantData.menus?.foods?.length ?? 0,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.68,
                  maxCrossAxisExtent: 250,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Beverages',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var data = widget.restaurantData.menus!.drinks;
                    return MenuCardWidget(
                      title: data?[index].name ?? 'null',
                      onTap: () {},
                    );
                  },
                  childCount: widget.restaurantData.menus?.drinks?.length ?? 0,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.68,
                  maxCrossAxisExtent: 250,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
