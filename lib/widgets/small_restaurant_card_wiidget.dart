import 'package:flutter/material.dart';
import '../common/constants.dart';

class SmallRestaurantCardWidget extends StatelessWidget {
  final String title;
  final ImageProvider image;
  final String location;
  final double rating;
  final VoidCallback onTap;
  final String id;
  const SmallRestaurantCardWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.id,
    required this.location,
    required this.rating,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shadowColor: kGrayColor[80]!.withOpacity(0.25),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 155,
          height: 216,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                    child: Hero(
                      tag: id,
                      child: Image(
                        image: image,
                        fit: BoxFit.cover,
                        height: 147,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 11,
                    child: Container(
                      width: 69,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: kPrimaryColorOrange[80]!.withOpacity(0.3),
                            spreadRadius: 0.0,
                            blurRadius: 20.0,
                            offset: const Offset(0.0, 5.0),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            rating.toString() + ' ',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.star,
                            color: kPrimaryColorYellow[100],
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 11,
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        color: kPrimaryColorOrange[100],
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: InkResponse(
                        onTap: () {},
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(height: 6),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.pin_drop_outlined,
                              color: kPrimaryColorOrange[100],
                              size: 15,
                            ),
                          ),
                          const TextSpan(
                            text: '  ',
                          ),
                          TextSpan(
                            text: location,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 14, color: kTyphographyColor[20]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
