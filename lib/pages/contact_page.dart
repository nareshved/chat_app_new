import 'package:flutter/material.dart';

class ContactPageUser extends StatelessWidget {
  const ContactPageUser({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("My Contacts"),
        centerTitle: true,
      ),
    );
  }
}