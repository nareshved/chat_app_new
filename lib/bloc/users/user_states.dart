
import '../../models/contact_model.dart';

abstract class UserStates {}


class UserInitialState extends UserStates {}

class UserLoadingState extends UserStates {}

class UserLoadedState extends UserStates {
  List<ContactModel> allusers;

  UserLoadedState({required this.allusers});
}

class UserErrorState extends UserStates {
  String errorMsg;
  UserErrorState({required this.errorMsg});
}



