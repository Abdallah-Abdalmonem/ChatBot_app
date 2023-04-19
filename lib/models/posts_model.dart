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

  factory PostsModel.fromJson(Map<String, dynamic> data) {
    return PostsModel(
      id: data['id'] ?? '',
      message: data['message'] ?? '',
      fullPicture: data["fullPicture"] ?? '',
      createdTime: data["createdTime"] ?? '',
    );
  }
}
