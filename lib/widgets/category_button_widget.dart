import 'package:flutter/material.dart';
import '../common/constants.dart';

class CategoryButtonWidget extends StatelessWidget {
  final String text;
  final Image image;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButtonWidget(
      {Key? key,
      required this.text,
      required this.image,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      width: 60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: (isSelected ? kPrimaryColorOrange[100] : kGrayColor[80])!
                  .withOpacity(0.25),
              spreadRadius: 0.0,
              blurRadius: 30.0,
              offset: const Offset(0.0, 20.0))
        ],
      ),
      child: Material(
        color: isSelected ? kPrimaryColorOrange[100] : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: image,
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color:
                            isSelected ? Colors.white : kTyphographyColor[80],
                        fontSize: 11,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
