abstract class CommentState {}

class InitialState extends CommentState {}

class LoadingGetCommentState extends CommentState {}

class SuccessGetCommentState extends CommentState {}

class ErrorGetCommentState extends CommentState {
  final String error;
  ErrorGetCommentState(this.error);
}
