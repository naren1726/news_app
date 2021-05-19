class News {
  News({this.title, this.summary, this.published, this.isFav = false});

  final String title;
  final String summary;
  final String published;
  bool isFav;

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] as String,
      summary: json['summary'] as String,
      published: json['published'] as String,
    );
  }

  void markFav() {
    this.isFav = true;
  }

  void unMarkFav() {
    this.isFav = false;
  }
}
