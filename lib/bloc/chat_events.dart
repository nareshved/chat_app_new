

import '../models/user_model.dart';

abstract class ChatEvents {}


class CreateUserEvent extends ChatEvents{

  // UserModel newUser;
  String email;
  String password;

  CreateUserEvent({required this.email
    , required this.password});
}

class LoginUserEvent extends ChatEvents{
  String loginEmail;
  String loginPassword;

  LoginUserEvent({required this.loginEmail, required this.loginPassword});
}

class LogOutUserEvent extends ChatEvents {}
