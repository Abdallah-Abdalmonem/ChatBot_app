class PostsModel {
  final String id;
  final String message;
  final String fullPicture;
  final String createdTime;

  PostsModel({
    required this.id,
    required this.message,
    required this.fullPicture,
    required this.createdTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
      'fullPicture': fullPicture,
      'createdTime': createdTime,
    };
  }

  factory PostsModel.fromJson(Map<String, dynamic> map) {
    return PostsModel(
      id: map['id'] ?? '',
      message: map['message'] ?? '',
      fullPicture: map["fullPicture"] ?? '',
      createdTime: map["createdTime"] ?? '',
    );
  }
}
