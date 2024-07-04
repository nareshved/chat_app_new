
import 'dart:developer';

import 'package:chat_app_new/bloc/users/user_events.dart';
import 'package:chat_app_new/bloc/users/user_states.dart';
import 'package:chat_app_new/models/contact_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../firebase/firebase_provider.dart';

class UserBloc extends Bloc<UserEvents, UserStates> {
  FirebaseProvider firebaseProvider;
  BuildContext context;

  UserBloc({required this.firebaseProvider, required this.context}) : super(UserInitialState()) {
  
  
   on<ContactsUserEvent>((event, emit) async {
      

     try{

      emit(UserLoadingState());

Future<QuerySnapshot<Map<String, dynamic>>> contactsFromFirebase () async {
   return FirebaseFirestore.instance
            .collection("users").get();
  }
      emit(UserLoadedState(
         allusers: contactsFromFirebase()
      ),);
      
      }
      catch(e){
        emit(UserErrorState(errorMsg: e.toString()));
        log("error contacts fetech From Firebase $e.toString()");
      }
    });
    
  
  }
    

    
  //   );
  // }

}

   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   