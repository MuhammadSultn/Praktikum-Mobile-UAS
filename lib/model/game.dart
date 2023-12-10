class Game {
  String imageUrl;
  String date;
  String description;
  String name;
  int good;
  int bad;
  double comment;
  int rated;
  String rateavg;
  List<String> moreImagesUrl;
  bool isFav;

  Game({
    required this.imageUrl,
    required this.date,
    required this.description,
    required this.name,
    required this.good,
    required this.bad,
    required this.comment,
    required this.rated,
    required this.rateavg,
    required this.moreImagesUrl,
    required this.isFav,
  });
}
