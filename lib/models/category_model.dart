class CategoryModel {
  final String id;
  final String title;
  final String image;

  CategoryModel({
    required this.id,
    required this.title,
    required this.image,
  });
}

class CategoryData {
  static List<CategoryModel> data = [
    CategoryModel(
      id: "1",
      title: 'Burger',
      image: 'assets/icons/category-icons/burger.png',
    ),
    CategoryModel(
      id: "2",
      title: 'Donut',
      image: 'assets/icons/category-icons/donut.png',
    ),
    CategoryModel(
      id: "3",
      title: 'Hotdog',
      image: 'assets/icons/category-icons/hotdog.png',
    ),
    CategoryModel(
      id: "4",
      title: 'Pizza',
      image: 'assets/icons/category-icons/pizza.png',
    ),
    CategoryModel(
      id: "5",
      title: 'Ice',
      image: 'assets/icons/category-icons/ice-cream.png',
    ),
  ];
}
