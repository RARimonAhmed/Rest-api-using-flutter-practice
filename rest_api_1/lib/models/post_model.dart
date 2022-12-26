class Posts {
  final int? userId, id;
  final String? title, body;

  Posts(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
  factory Posts.FromJSON(Map<String, dynamic> json) {
    return Posts(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}
