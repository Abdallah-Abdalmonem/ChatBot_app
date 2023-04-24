class CommentsModel {
  final String message;
  final String createdTime;
  final String id;

  CommentsModel({
    required this.message,
    required this.createdTime,
    required this.id,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> data) {
    return CommentsModel(
      message: data['message'],
      createdTime: data["created_time"],
      id: data["id"],
    );
  }
}
