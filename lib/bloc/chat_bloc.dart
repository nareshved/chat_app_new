
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../firebase_provider/firebase_provider.dart';
import 'chat_events.dart';
import 'chat_states.dart';

class ChatBloc extends Bloc<ChatEvents, ChatStates>{

 // FirebaseProvider firebaseProvider;

  ChatBloc() : super(ChatIntitalState()){

    on<CreateUserEvent>((event, emit) async {

      try {

      emit(RegisterLoadingState());

      await FirebaseProvider().createUser(event.email, event.password );

      emit(RegisterLoadedState());

      }

      catch(e){

         emit(RegisterErrorState(errorMsg: e.toString()));

         log("error msg in create user Bloc $e.toString()");
      }
    });



    on<LoginUserEvent>((event, emit) async{

      try{

      emit(RegisterLoadingState());

      await FirebaseProvider().loginUser(email: event.loginEmail, mPassord: event.loginPassword);
      
      emit(RegisterLoadedState());
      }
      catch(e){

        emit(RegisterErrorState(errorMsg: e.toString()));

        log("error loginUser event in bloc $e.toString()");
      }
    });


    on<LogOutUserEvent>((event, emit) async{

      try{

      await FirebaseProvider.userLogOut();
      }
      catch(e){

        emit(RegisterErrorState(errorMsg: e.toString()));

        log("error user Logout event in bloc $e.toString()");
      }

     
    });
  }
}





















/// before create a new events

// import 'dart:developer';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wachat/bloc/chat_events.dart';
// import 'package:wachat/bloc/chat_states.dart';
// import 'package:wachat/firebase_provider/firebase_provider.dart';

// class ChatBloc extends Bloc<ChatEvents, ChatStates>{

//   FirebaseProvider firebaseProvider;

//   ChatBloc({required this.firebaseProvider}) : super(ChatIntitalState()){

//     on<CreateUserEvent>((event, emit) async {

//       try {

//       emit(ChatLoadingState());

//       await firebaseProvider.createUser(event.newUser, event.password );

//       emit(ChatLoadedState());

//       }

//       catch(e){

//          emit(ChatErrorState(errorMsg: e.toString()));

//          log("error msg in create user Bloc $e.toString()");
//       }
//     });



//     on<LoginUserEvent>((event, emit) async{

//       try{

//       emit(ChatLoadingState());

//       await firebaseProvider.loginUser(email: event.loginEmail, mPassord: event.loginPassword);
      
//       emit(ChatLoadedState());
//       }
//       catch(e){

//         emit(ChatErrorState(errorMsg: e.toString()));

//         log("error loginUser event in bloc $e.toString()");
//       }
//     });




//     on<LogOutUserEvent>((event, emit) async{

//       try{

//       await FirebaseProvider.userLogOut();
//       }
//       catch(e){

//         emit(ChatErrorState(errorMsg: e.toString()));

//         log("error user Logout event in bloc $e.toString()");
//       }

     
//     });
//   }
// }






























// before sir pages copy login siignup

// import 'dart:developer';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wachat/bloc/events.dart';
// import 'package:wachat/bloc/states.dart';
// import 'package:wachat/firebase_provider/firebase.dart';

// class ChatBloc extends Bloc<ChatEvents, ChatStates>{

//   FirebaseProvider firebaseProvider;

//   ChatBloc({required this.firebaseProvider}) : super(ChatIntitalState()){

//     on<CreateUserEvent>((event, emit) async {

//       try {

//       emit(ChatLoadingState());

//       await firebaseProvider.createUser(event.newUser, event.password );

//       emit(ChatLoadedState());

//       }

//       catch(e){

//          emit(ChatErrorState(errorMsg: e.toString()));

//          log("error msgin create user Bloc $e.toString()");
//       }
//     });



//     on<LoginUserEvent>((event, emit) async{

//       try{

//       emit(ChatLoadingState());

//       await firebaseProvider.loginUser(email: event.loginEmail, mPassord: event.loginPassword);
      
//       emit(ChatLoadedState());
//       }
//       catch(e){

//         emit(ChatErrorState(errorMsg: e.toString()));

//         log("error login event in bloc $e.toString()");
//       }
//     });




//     on<LogOutUserEvent>((event, emit) async{

//       try{

//       await FirebaseProvider.userLogOut();
//       }
//       catch(e){

//         emit(ChatErrorState(errorMsg: e.toString()));

//         log("error user Logout event in bloc $e.toString()");
//       }

     
//     });
//   }
// }