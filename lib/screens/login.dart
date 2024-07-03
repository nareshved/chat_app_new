
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';


import '../app_routes/app_routes.dart';
import '../widgets/textfield.dart';
import 'home_screen.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  static const String LOGIN_PREFS_KEY = "isLogin";

  final mFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginPage"),
      ),
      body: Form(
        key: mFormKey,
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Login Your Account!",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  myTextField(
                    validator: (value) {},
                    mcrontroller: emailController,
                    hinttxt: "Enter Your email",
                    labelTxt: "Email",
                    preIcon: const Icon(Icons.email),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  myTextField(
                    validator: (value) {},
                    mcrontroller: passController,
                    hinttxt: "Enter Your password",
                    labelTxt: "password",
                    preIcon: const Icon(Icons.remove_red_eye),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      onPressed: () async  {

                        // BlocProvider.of<RegisterBloc>(context).add(LoginUserEvent(
                        //   loginEmail: emailController.text.toString(), loginPassword: passController.text.toString()));


                        /// firebase login

                        String email = emailController.text;
                        String password = passController.text;

                        if (emailController.text.isNotEmpty &&
                            passController.text.isNotEmpty) {
                          try {
                            UserCredential credential = await FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword(
                                email: email, password: password);

                            var prefs = await SharedPreferences.getInstance();
                            prefs.setString(LOGIN_PREFS_KEY, credential.user!.uid);



                            /// const remove

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ));

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "SuccessFully Account Login")));
                          } on FirebaseException catch (myErrors) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(myErrors.code)));
                          }
                        }

                        /// if
                        emailController.clear();
                        passController.clear();
                      },
                      child: const Text("Login Now!")),




                  // Login blocCounsumer widget button


                  // BlocConsumer<RegisterBloc, RegisterState>(
                  //   listener: (context, state){
                  //     if(state is RegisterLoadedState){
                  //       Navigator.pop(context);
                  //     } else if(state is RegisterErrorState){
                  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                  //     }
                  //   },
                  //   builder: (context, state) {
                  //     if(state is RegisterLoadingState){
                  //       return ElevatedButton(onPressed: (){}, child: const Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           CircularProgressIndicator(),
                  //           SizedBox(width: 11,),
                  //           Text('Loading')
                  //         ],
                  //       ));
                  //     }
                  //      return ElevatedButton(
                  //         onPressed: () async {
                  //           /// firebase sign Up

                  //           if (mFormKey.currentState!.validate()) {
                              
                  //             if (emailController.text.isNotEmpty &&
                  //                 passController.text.isNotEmpty) {
                               

                  //               BlocProvider.of<RegisterBloc>(context).add(LoginUserEvent(
                  //         loginEmail: emailController.text.toString(), loginPassword: passController.text.toString()));
                  //             }

                  //             /// if
                  //           }
                  //         },
                  //         child: const Text("Login Now!"));
                  //   },
                  // ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.signUpScreen);

                      },
                      child: const Text("Create An Account")),
                ],
              ),
            )),
      ),
    );
  }
}

























/*

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';
import 'signup.dart';
import 'widgets_prefs/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  static const String LOGIN_PREFS_KEY = "isLogin";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginPage"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login Your Account!",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 19,
            ),
            myTextField(
              mcrontroller: emailController,
              hinttxt: "Enter Your email",
              labelTxt: "Email",
              preIcon: const Icon(Icons.email),
            ),
            const SizedBox(
              height: 12,
            ),
            myTextField(
              mcrontroller: passController,
              hinttxt: "Enter Your password",
              labelTxt: "password",
              preIcon: const Icon(Icons.remove_red_eye),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool(LOGIN_PREFS_KEY, true);

                  /// firebase login

                  String email = emailController.text;
                  String password = passController.text;

                  if (emailController.text.isNotEmpty &&
                      passController.text.isNotEmpty) {
                    try {
                      UserCredential credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email, password: password);

/*

                 var storepass = passController.text.trim();
                 var saveCredintial = credential;

                 print("User Secret pass : ${storepass}");
*/

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));

                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("SuccessFully Account Login")));
                    } on FirebaseException catch (myErrors) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(myErrors.code)));
                    }
                  }

                  /// if
                  emailController.clear();
                  passController.clear();
                },
                child: const Text("Login Now!")),
            SizedBox(
              height: 25,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ));
                },
                child: Text("Create An Account")),
          ],
        ),
      )),
    );
  }
}


*/