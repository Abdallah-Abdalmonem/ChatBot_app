abstract class CommentState {}

class InitialState extends CommentState {}

class LoadingGetPostsState extends CommentState {}

class SuccessGetPostsState extends CommentState {}
class ErrorGetPostsState extends CommentState {
  final String error;
  ErrorGetPostsState(this.error);
}

class LoadingGetCommentState extends CommentState {}

class SuccessGetCommentState extends CommentState {}

class ErrorGetCommentState extends CommentState {
  final String error;
  ErrorGetCommentState(this.error);
}

class LoadingAddCommentState extends CommentState {}

class SuccessAddCommentState extends CommentState {}

class ErrorAddCommentState extends CommentState {
  final String error;
  ErrorAddCommentState(this.error);
}


class LoadingGetNumberCommentState extends CommentState {}

class SuccessGetNumberCommentState extends CommentState {}

class ErrorGetNumberCommentState extends CommentState {
  final String error;
  ErrorGetNumberCommentState(this.error);
}
