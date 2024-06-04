

import 'package:flutter/material.dart';

Widget mTextFormField ({
  required TextInputType keyboard,
  required TextEditingController controller,
  String? Function(String?)? myValidator,
  bool obscureTxt = false,
  String? obscuringCharacter,
  String? hint, required Color mcColor, required BorderRadiusGeometry? mcBorder,
   required double? mWidth

}) {

  return Container(
    width: mWidth,
    decoration: BoxDecoration(
     color: mcColor,
      borderRadius: mcBorder,
    ),
    child: TextFormField(
      
      keyboardType: keyboard,
      controller: controller,
      autocorrect: true,
      autofocus: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      minLines: 1,
      validator: myValidator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(55)
        ),
        hintText: hint,
      
      ),
    ),
  );
}