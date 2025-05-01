class StreamPostModel {
  final int id;
  final String title;

  StreamPostModel({required this.id, required this.title});

  factory StreamPostModel.fromJson(Map<String, dynamic> json) {
    return StreamPostModel(
      id: json['id'],
      title: json['title'],
    );
  }
}
