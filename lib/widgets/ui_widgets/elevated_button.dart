
import 'package:flutter/material.dart';

Widget mcButton ({required String name, required VoidCallback onTap}) {

  return ElevatedButton(
      onPressed: (){
        onTap;
      }, child: Text(name),

  );
}