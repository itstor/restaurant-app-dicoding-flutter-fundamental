import 'package:flutter/material.dart';
import '../common/constants.dart';

class FeaturedCardWidget extends StatelessWidget {
  final String title;
  final ImageProvider image;
  final String location;
  final double rating;
  final VoidCallback onTap;
  final List<String> tags;
  const FeaturedCardWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.location,
    required this.rating,
    required this.onTap,
    required this.tags,
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
          width: 266,
          height: 229,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image(
                    image: image,
                    fit: BoxFit.cover,
                    height: 136,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 10,
                    left: 11,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
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
                padding: const EdgeInsets.all(13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 14,
                                      color: kTyphographyColor[20],
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: tags
                          .map((e) => _buildTagWidget(context, e.toUpperCase()))
                          .toList(),
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

  Container _buildTagWidget(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(
        color: kGrayColor[20],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.button!.copyWith(
              fontSize: 12,
              color: kTyphographyColor[20],
            ),
      ),
    );
  }
}
