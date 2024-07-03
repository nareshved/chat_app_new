
import 'package:chat_app_new/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../screens/contact_page.dart';
import '../screens/login.dart';
import '../screens/signup.dart';
import '../screens/splash.dart';

class AppRoutes {
  
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String homeScreen = '/home_screen';

  static const String contactScreen = '/contact_screen';

  static const String chatScreen = '/chat_screen';



  static Map<String, WidgetBuilder> get routes => {
        splashScreen : (context) => const SplashPage(),
         loginScreen : (context) => const LoginPage(),
         signUpScreen : (context) => SignUpPage.builder(),
         homeScreen : (context) => const HomeScreen(),
         contactScreen : (context) => const ContactPage(),
       //  chatScreen : (context) => ChatScreen(),
      };
}