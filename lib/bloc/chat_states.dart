abstract class ChatStates {}


class RegisterInitialState extends ChatStates {}

class RegisterLoadingState extends ChatStates {}

class RegisterLoadedState extends ChatStates {}

class RegisterErrorState extends ChatStates {
  String errorMsg;
  RegisterErrorState({required this.errorMsg});
}


class ChatIntitalState extends ChatStates {}

class ChatLoadingState extends ChatStates {}

class ChatLoadedState extends ChatStates {}

class ChatErrorState extends ChatStates {
  String errorMsg;
  ChatErrorState({required this.errorMsg});
}