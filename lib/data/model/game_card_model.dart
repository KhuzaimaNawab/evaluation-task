class GameCardModel {
  final String id;
  final String title;
  final String image;
  final List<String> details;

  GameCardModel({
    required this.id,
    required this.title,
    required this.image,
    required this.details,
  });

  factory GameCardModel.fromJson(Map<String, dynamic> json) {
    final genreList = json['genre'] as List<dynamic>;
    final genreTitles = genreList.map((genre) => genre['title'] as String).toList();

    final platformTitle = json['platform']['title'] as String;

    final tagTitle = json['tags'][0]['title'] as String;

    final details = [...genreTitles, platformTitle, tagTitle];

    return GameCardModel(
      id: json['_id'],
      title: json['title'],
      image: json['image'],
      details: details,
    );
  }
}
