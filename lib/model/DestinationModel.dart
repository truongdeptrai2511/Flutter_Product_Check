import 'dart:core';
class DestinationModel{
  final String id;
  final String name;
  final String image;
  final List<String> genre;
  final int rating;

  DestinationModel(this.id, this.name, this.image, this.genre, this.rating);

  static List<DestinationModel> MockData(){
    List<DestinationModel> ls = [];
    ls.add(DestinationModel(
      "1",
      "Holligood",
      "assets/images/eberhard-grossgasteiger-YbSn3E89Lqk-unsplash.jpg",[''],4
    ));
    ls.add(DestinationModel(
        "2",
        "Holligood",
        "assets/images/eberhard-grossgasteiger-YbSn3E89Lqk-unsplash.jpg",[''],4
    ));
    ls.add(DestinationModel(
        "3",
        "Holligood",
        "assets/images/eberhard-grossgasteiger-YbSn3E89Lqk-unsplash.jpg",[''],4
    ));
    return ls;
  }
}