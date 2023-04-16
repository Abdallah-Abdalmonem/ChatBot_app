abstract class CommentState {}

class InitialState extends CommentState {}


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


class LoadingHideCommentState extends CommentState {}

class SuccessHideCommentState extends CommentState {}

class ErrorHideCommentState extends CommentState {
  final String error;
  ErrorHideCommentState(this.error);
}


class CommentIconHidenState extends CommentState {}

class CommentIconNotHidenState extends CommentState {}
