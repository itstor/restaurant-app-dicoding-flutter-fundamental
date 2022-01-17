import 'package:flutter/material.dart';
import 'package:flutter_fundamental_1/models/category_model.dart';
import 'package:flutter_fundamental_1/widgets/category_button_widget.dart';

class CategoryListWidget extends StatefulWidget {
  const CategoryListWidget({
    Key? key,
    required this.categoryData,
  }) : super(key: key);

  final List<CategoryModel> categoryData;

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(left: index != 0 ? 12 : 25),
          child: CategoryButtonWidget(
            text: widget.categoryData[index].title,
            image: Image.asset(widget.categoryData[index].image),
            isSelected: index == _index ? true : false,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Not implemented yet'),
                ),
              );
              setState(() {
                _index = index;
              });
            },
          ),
        );
      },
      itemCount: widget.categoryData.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
