import 'dart:developer';

import 'package:flutter/material.dart';

import 'contact_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {

  TextEditingController searchController = TextEditingController();

  int bottomNavBarSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WA Chat"),
        centerTitle: true,
      ),

      drawer: const Drawer(),

      bottomNavigationBar: BottomNavigationBar(

        onTap: (value) {
          setState(() {
            bottomNavBarSelectedIndex = value;
            log("index changed $value");
          });
        },
      
        currentIndex: bottomNavBarSelectedIndex,
        items:  const [
          BottomNavigationBarItem(
            label: "home",
            icon: Icon(Icons.home)
            ),

            BottomNavigationBarItem(
            label: "new chat",
            icon: Icon(Icons.chat)
            ),
        ],

      ),

      floatingActionButton: FloatingActionButton(onPressed: (){

        Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactPageUser(),));
      }, child: const Icon(Icons.add),),
    );
  }

}