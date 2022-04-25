class blogModel {
  String? title;
  String? blog_body;

  blogModel();

  // sending data to our server
  Map<String, dynamic> toJson() => {
        'title': title,
        'blog_body': blog_body,
      };

  blogModel.fromSnapshot(snapshot)
      : title = snapshot.data()['title'],
        blog_body = snapshot.data()['blog_body'];
}
