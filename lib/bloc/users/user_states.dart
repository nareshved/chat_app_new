
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserStates {}


class UserInitialState extends UserStates {}

class UserLoadingState extends UserStates {}

class UserLoadedState extends UserStates {
  Future<QuerySnapshot<Map<String, dynamic>>> allusers;
  UserLoadedState({required this.allusers});
}

class UserErrorState extends UserStates {
  String errorMsg;
  UserErrorState({required this.errorMsg});
}



