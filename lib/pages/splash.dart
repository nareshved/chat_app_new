
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../prefs/prefs_class.dart';
import 'home.dart';
import 'login.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() {
   return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {


    // navigatorUser(Widget navigateTo) {   // function for navigator to home
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => navigateTo,));
    //   }


  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () async {

      //PrefsUser.prefsGetString(PrefsUser.prefsloginString, myKey: myKey); // fun


      final prefs = await SharedPreferences.getInstance();
       String? myKey = prefs.getString(PrefsUser.prefsloginString);



      //  final prefs = await SharedPreferences.getInstance();
      //  String? myKey = 'hi';    ///ask 

      // log(myKey.toString());



      Widget navigateTo = LoginPage();

      if(myKey != null && myKey != "" ){   /// prefs with firebase
        navigateTo = const HomePage();

   // navigatorUser(navigateTo);

      }

       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => navigateTo,));
     

    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     
     body: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          CircleAvatar(
          radius: 35,
            child: Icon(Icons.chat_sharp, color: Colors.pink, size: 33,),
          ),
       
          Text("waChat", style: TextStyle(fontSize: 22),)
        ],
       ),
     ),

    );
  }

}












  // Timer(const Duration(seconds: 4), () async {


  //     PrefsUser.prefsGetString(PrefsUser.prefsloginString); // fun



  //     final prefs = await SharedPreferences.getInstance();
  //     String? myKey = prefs.getString(LoginPage.LOGIN_PREFS_KEY);

  //     Widget navigateTo =  LoginPage();

  //     if(myKey != null && myKey != "" && FirebaseProvider.firebaseAuth.currentUser != null){   /// prefs with firebase
  //       navigateTo = const HomePage();

  //    navigatorUser(navigateTo);

  //     }

  //   });