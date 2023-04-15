abstract class PostState {}

class InitialState extends PostState {}

class LoadingGetPostsState extends PostState {}

class SuccessGetPostsState extends PostState {}
class ErrorGetPostsState extends PostState {
  final String error;
  ErrorGetPostsState(this.error);
}
