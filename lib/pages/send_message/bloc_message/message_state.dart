abstract class MessageState {}

class InitialState extends MessageState {}

class LoadingGetIdsState extends MessageState {}

class SuccessGetIdsState extends MessageState {}

class ErrorGetIdState extends MessageState {
  final String error;
  ErrorGetIdState(this.error);
}
