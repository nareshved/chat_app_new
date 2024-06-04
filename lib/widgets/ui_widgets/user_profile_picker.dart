
import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';


Future userPic (ImageSource mImageSource, Function(File) updateimage ) async {
 
   try{

    final photo = await ImagePicker().pickImage(source: mImageSource);

    if(photo == null ) return;

    final tempImagePath = File(photo.path);

   updateimage(tempImagePath);
     
   } 

    catch(e){
      log(" error $e.toString()");
    }

}






























// by sir 
// import 'dart:developer';
// import 'dart:io';

// import 'package:image_picker/image_picker.dart';


// Future userPic (ImageSource mImageSource, Function(File) updateimage ) async {
 
//    try{

//     final photo = await ImagePicker().pickImage(source: mImageSource);

//     if(photo == null ) return;

//     final tempImagePath = File(photo.path);

//    updateimage(tempImagePath);
     
//    } 

//     catch(e){
//       log(" error $e.toString()");
//     }

// }