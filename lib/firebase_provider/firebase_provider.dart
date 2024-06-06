
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/user_model.dart';
import '../prefs/prefs_class.dart';


class FirebaseProvider {

  static final firebaseAuth = FirebaseAuth.instance;

  static final fireBaseFireStore = FirebaseFirestore.instance;

  static final firebaseStorage = FirebaseStorage.instance.ref();

  


/// firebase collections
  static const String userCollection = "users";

  static const  String collectionChat = "chats";

  static const String collectionPasswords = "users passwords";   // for me optional

   UserModel? user;

  Future<void> createUser(String email, String mPassord) async {
  
  try {

    final UserCredential credential = await firebaseAuth.createUserWithEmailAndPassword
    (email: email, password: mPassord);


   if(credential.user != null ) {

     fireBaseFireStore.collection(userCollection)
    .doc(credential.user!.uid).set(user!.toDoc());


    /// second collection optional
    
    fireBaseFireStore.collection(collectionPasswords).
    doc(credential.user!.uid).set({
      "name" : user!.name,
      "password" : user!.password
    });



  }

  else {
    log("found user is null in firebase provider");
  }
    
  } 

  on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    log('The password provided is too weak.');

    PrefsUser().showmBar('The password provided is too weak.');

  } 
  
  else if (e.code == 'email-already-in-use') {
    log('The account already exists for that email.');

    PrefsUser().showmBar('The account already exists for that email.');
  
  }

} catch (e) {
  log("user not created error $e.toString()");
  
}
  }


    Future<void> loginUser ({required String email, required String mPassord})async {

      try{

        final  UserCredential credential = 
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: mPassord);

      if(credential.user != null){

        PrefsUser.prefsUserUidString(value: credential.user!.uid); 
            // refs UID Saved
        log( PrefsUser.prefsUserUidString(value: credential.user!.uid).toString());    // refs UID Saved
      
        PrefsUser.prefsSetBool(value: true);

      }
      } catch(e){

        log("user login failed error $e.toString()");
      }
    }


   static userLogOut () async {

      await firebaseAuth.signOut();

      PrefsUser().showmBar("You are signOut");

      log("user signOut from firebase");

      PrefsUser.prefsSetlogOut(value: "");

      log("user signOut from prefs");
    }







  // static getUserProfilePicUrl () async {

  //        // email id for unique folder name for profile pic otherwise uuid package use niche child
  //          final savedPic =  await FirebaseProvider.firebaseStorage.child("profilePic").child(emailController.text.trim().toString()).putFile(profilePic!);

  //           final String downloadImgUrl = await savedPic.ref.getDownloadURL();
  // }



}