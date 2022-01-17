class Drinks {
  String? name;
  String? pictureUrl;

  Drinks({this.name, this.pictureUrl});

  Drinks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    pictureUrl = json['pictureUrl'];
  }
}
