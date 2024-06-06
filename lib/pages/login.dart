import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_bloc.dart';
import '../bloc/chat_events.dart';
import '../bloc/chat_states.dart';
import '../widgets/ui_widgets/elevated_button.dart';
import '../widgets/ui_widgets/textfield.dart';
import 'home.dart';
import 'signup.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key,});

  static String LOGIN_PREFS_KEY = "isLogin";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  static final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: loginFormKey,
              child: Column(
                children: [
                  const Center(
                      child: Text(
                    "login",
                    style: TextStyle(fontSize: 22),
                  )),
                  SizedBox(height: mq.height * 0.025),
                  mTextFormField(
                      myValidator: (value) {
                        if (value!.isEmpty) {
                          return "this field is required don't empty";
                        } 
                      },
                      hint: "enter your email",
                      keyboard: TextInputType.emailAddress,
                      controller: emailController,
                      mcColor: Colors.white70,
                      mcBorder: BorderRadius.circular(12),
                      mWidth: mq.width),
                  SizedBox(height: mq.height * 0.025),
                  mTextFormField(
                      myValidator: (value) {
                        if (value!.isEmpty) {
                          return "your password is required";
                        } else if (value.length < 6) {
                          return "at least your password is 6 characters";
                        } 
                      },
                      hint: "enter a password",
                      keyboard: TextInputType.text,
                      controller: passController,
                      mcColor: Colors.white70,
                      mcBorder: BorderRadius.circular(12),
                      mWidth: mq.width),
                  SizedBox(height: mq.height * 0.025),
                  SizedBox(
                      width: mq.width,


                      child: BlocConsumer<ChatBloc, ChatStates>(
                        
                        listener: (context, state) {
                          
                          if(state is RegisterLoadedState){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                          }
                        },
                        
                        builder: (context, state) {
                         if(state is RegisterLoadingState){
                          return const Center(child: CircularProgressIndicator(),);
                         }

                          return mcButton(
                              name: "Login",
                              onTap: () async {
                                if (loginFormKey.currentState!.validate()) {
                                  if (emailController.text.trim().isNotEmpty &&
                                      passController.text.trim().isNotEmpty) {
                          
                               BlocProvider.of<ChatBloc>(context).add(LoginUserEvent(
                                loginEmail: emailController.text.toString(), 
                                loginPassword: passController.text.toString()));
                                      }
                                      
                                }
                              });

                        }
                      )),

                          const SizedBox(
                    height: 25,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ));
                      },
                      child: const Text("Go Signup Page")),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
