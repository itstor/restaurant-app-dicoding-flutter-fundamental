class Foods {
  String? name;
  String? pictureUrl;

  Foods({this.name, this.pictureUrl});

  Foods.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    pictureUrl = json['pictureUrl'];
  }
}
