
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget myTextField ({
  required String hinttxt,
  Icon? preIcon, Icon? suffIcon,
   String? labelTxt,
  required TextEditingController mcrontroller,
  required String? Function(String? value) validator

}){
  return TextFormField(
    validator: validator,
    controller: mcrontroller,
    decoration: InputDecoration(
      label: Text(labelTxt!),
        prefixIcon: preIcon,
        suffixIcon: suffIcon,
        border: const OutlineInputBorder(
        ),
        hintText: hinttxt,

    ),
  );
}


















// customCheckStream(
//     {required String decument,
//     required String whatYouNeed,
//     required String mainCollection,}) {
//   return StreamBuilder<DocumentSnapshot>(
//     stream: FirebaseFirestore.instance
//         .collection(mainCollection)
//         .doc(decument)
//         .snapshots(),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return const CircularProgressIndicator(
//           strokeWidth: 1,
//         );
//       } else if (snapshot.hasError) {
//         return Text('Error: ${snapshot.error}');
//       } else if (!snapshot.hasData || !snapshot.data!.exists) {
//         return const Text('No user data found');
//       }

//       var userData = snapshot.data!.data() as Map<String, dynamic>?;
//       if (userData == null || !userData.containsKey(whatYouNeed)) {
//         return const Text('No user data found');
//       }

//       var checkData = userData[whatYouNeed];

//       return Text(
//         checkData != null ? checkData.toString() : 'Data not found',
    
//       );
//     },
//   );
// }