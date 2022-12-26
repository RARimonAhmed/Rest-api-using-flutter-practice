class PhotoModel {
  final String title, url, thumbnailUrl;
  final int id;

  PhotoModel(
      {required this.title,
      required this.url,
      required this.thumbnailUrl,
      required this.id});
  factory PhotoModel.fromJSON(Map<String, dynamic> json) {
    return PhotoModel(
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl'],
        id: json['id']);
  }
  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    data['id'] = id;
    return data;
  }
}
