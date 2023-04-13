class Temperatures {
  Temperatures({
    required this.posts,
    required this.id,
  });

  Posts posts;
  String id;
}

class Posts {
  Posts({
    required this.data,
  });

  List<Datum> data;
}

class Datum {
  Datum({
    this.fullPicture,
    required this.message,
    required this.createdTime,
    required this.id,
  });

  String? fullPicture;
  String message;
  String createdTime;
  String id;
}
