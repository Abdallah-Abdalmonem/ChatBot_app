part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class LoadingGetPostsState extends PostsState {}

class SuccessGetPostsState extends PostsState {
  Map<String, dynamic> posts;
  SuccessGetPostsState({required this.posts});
}

class ErrorGetPostsState extends PostsState {
  final String error;
  ErrorGetPostsState(this.error);
}
