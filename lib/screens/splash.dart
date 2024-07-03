
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_routes/app_routes.dart';
import 'login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    super.initState();

    /// get prefs key

    Timer(const Duration(seconds: 3), () async {

      var prefs = await SharedPreferences.getInstance();
      String? myKey =  prefs.getString(LoginPageState.LOGIN_PREFS_KEY);

      String navigateTo = AppRoutes.loginScreen;

      if(myKey != null && myKey!=""){
        navigateTo = AppRoutes.homeScreen;         /// const remove
      }

      Navigator.pushReplacementNamed(context, navigateTo);


    },);




  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.light_mode, size: 42.0,color: Colors.white),
            Text("Chatbook", style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}