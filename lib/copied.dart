 /// import 'dart:developer';
 // import 'dart:io';
 // import 'package:flutter/material.dart';
 // import 'package:flutter_bloc/flutter_bloc.dart';
 // import 'package:image_picker/image_picker.dart';
 // import '../bloc/chat_bloc.dart';
 // import '../bloc/chat_events.dart';
 // import '../bloc/chat_states.dart';
 // import '../firebase_provider/firebase_provider.dart';
 // import '../models/user_model.dart';
 // import '../widgets/ui_widgets/elevated_button.dart';
 // import '../widgets/ui_widgets/textfield.dart';
 // import '../widgets/ui_widgets/user_profile_picker.dart';
 // import 'login.dart';
 //
 // // ignore: must_be_immutable
 // class SignUpPage extends StatefulWidget {
 //   const SignUpPage({
 //     super.key,
 //   });
 //
 //   static final signUpFormKey = GlobalKey<FormState>();
 //
 //   @override
 //   State<SignUpPage> createState() => _SignUpPageState();
 // }
 //
 // class _SignUpPageState extends State<SignUpPage> {
 //   File? profilePic;
 //
 //   final TextEditingController nameController = TextEditingController();
 //
 //   final TextEditingController emailController = TextEditingController();
 //
 //   final TextEditingController passController = TextEditingController();
 //
 //   final TextEditingController phoneController = TextEditingController();
 //
 //   final TextEditingController homeAddressController = TextEditingController();
 //
 //   List<dynamic> genderOptionList = ["male", "female", "other"];
 //
 //   String selectedGender = "male";
 //
 //   String? genderSave;
 //
 //   @override
 //   Widget build(BuildContext context) {
 //     final mq = MediaQuery.of(context).size;
 //
 //     return Scaffold(
 //       body: Padding(
 //         padding: const EdgeInsets.all(15),
 //         child: BlocConsumer<ChatBloc, ChatStates>(
 //         listener: (context, state) {
 //     if (state is RegisterLoadedState) {
 //     Navigator.pushReplacement(
 //     context,
 //     MaterialPageRoute(
 //     builder: (context) => LoginPage(),
 //     ));
 //     } else if (state is RegisterErrorState) {
 //     ScaffoldMessenger.of(context).showSnackBar(
 //     SnackBar(content: Text(state.errorMsg)));
 //     }
 //     }, builder: (context, state) {
 //     if (state is RegisterLoadingState) {
 //     return const Center(
 //     child: CircularProgressIndicator(),
 //     );
 //     }
 //
 //     return Center(
 //     child: SingleChildScrollView(
 //     child: Form(
 //     key: SignUpPage.signUpFormKey,
 //     child: Column(
 //     children: [
 //     const Center(
 //     child: Text(
 //     "SignUp",
 //     style: TextStyle(fontSize: 22),
 //     )),
 //     SizedBox(height: mq.height * 0.025),
 //     InkWell(
 //     onTap: () {
 //     // calling class UserProfileState
 //     userPic(ImageSource.gallery, _updateProfilePic);
 //     },
 //     child: profilePic != null
 //     ? CircleAvatar(
 //     backgroundImage: FileImage(profilePic!),
 //     radius: 45,
 //     )
 //         : const CircleAvatar(
 //     radius: 45,
 //     backgroundColor: Colors.grey,
 //     ),
 //     ),
 //     SizedBox(height: mq.height * 0.025),
 //     mTextFormField(
 //     myValidator: (value) {
 //     if (value!.isEmpty) {
 //     return "this field is required dont empty";
 //     }
 //     },
 //     hint: "enter your name",
 //     keyboard: TextInputType.text,
 //     controller: nameController,
 //     mcColor: Colors.white70,
 //     mcBorder: BorderRadius.circular(12),
 //     mWidth: mq.width),
 //     SizedBox(height: mq.height * 0.025),
 //     Row(
 //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
 //     children: [
 //     const Text("Gender"),
 //     const Text("Male"),
 //     Radio.adaptive(
 //     value: genderOptionList[0],
 //     groupValue: selectedGender,
 //     onChanged: (value) {
 //     setState(() {
 //     selectedGender = value!;
 //     genderSave = value!;
 //
 //     log("saved male to var $genderSave");
 //     });
 //     }),
 //     const Text("Female"),
 //     Radio.adaptive(
 //     value: genderOptionList[1],
 //     groupValue: selectedGender,
 //     onChanged: (value) {
 //     setState(() {
 //     selectedGender = value!;
 //     genderSave = value!;
 //
 //     log("saved female to var $genderSave");
 //     });
 //     }),
 //     const Text("other"),
 //     Radio.adaptive(
 //     value: genderOptionList[2],
 //     groupValue: selectedGender,
 //     onChanged: (value) {
 //     setState(() {
 //     selectedGender = value!;
 //     genderSave = value!;
 //
 //     log("saved other to var $genderSave");
 //     });
 //     }),
 //     ],
 //     ),
 //     SizedBox(height: mq.height * 0.025),
 //     mTextFormField(
 //     myValidator: (value) {
 //     if (value!.isEmpty) {
 //     return "your email is required";
 //     }
 //     },
 //     hint: "enter a email",
 //     keyboard: TextInputType.emailAddress,
 //     controller: emailController,
 //     mcColor: Colors.white70,
 //     mcBorder: BorderRadius.circular(12),
 //     mWidth: mq.width),
 //     SizedBox(height: mq.height * 0.025),
 //     mTextFormField(
 //     myValidator: (value) {
 //     if (value!.isEmpty) {
 //     return "password is required";
 //     } else if (value.length < 6) {
 //     return "at least password length is 6";
 //     }
 //     },
 //     hint: "enter a password",
 //     keyboard: TextInputType.text,
 //     controller: passController,
 //     mcColor: Colors.white70,
 //     mWidth: mq.width,
 //     mcBorder: BorderRadius.circular(12),
 //     ),
 //     SizedBox(height: mq.height * 0.025),
 //     mTextFormField(
 //     myValidator: (value) {
 //     if (value!.isEmpty) {
 //     return "phone number is required";
 //     } else if (value.length <= 9) {
 //     return "not valid mobile number";
 //     }
 //     },
 //     hint: "mobile number",
 //     keyboard: TextInputType.phone,
 //     controller: phoneController,
 //     mcColor: Colors.white70,
 //     mcBorder: BorderRadius.circular(12),
 //     mWidth: mq.width),
 //     SizedBox(height: mq.height * 0.025),
 //     mTextFormField(
 //     myValidator: (value) {
 //     if (value!.isEmpty) {
 //     return "enter home address";
 //     }
 //     },
 //     hint: "home address",
 //     keyboard: TextInputType.streetAddress,
 //     controller: homeAddressController,
 //     mcColor: Colors.white70,
 //     mcBorder: BorderRadius.circular(12),
 //     mWidth: mq.width),
 //     SizedBox(height: mq.height * 0.025),
 //
 //     ],
 //     ),
 //     ),
 //     ),
 //
 //     );})));
 //   }
 //
 //   void _updateProfilePic(File newImage) {
 //     setState(() {
 //       profilePic = newImage;
 //     });
 //   }
 // }
 //
 //
 //
 //
 //
 //
 //
 //
 //
 //
 //
 //
 //
 //
 //
 //
 //
 //
 //
 //
 // // SizedBox(
 // //                       width: mq.width,
 // //                       child: mcButton(
 // //                           name: "SignUp",
 // //                           onTap: () {
 // //                             if (SignUpPage.signUpFormKey.currentState!
 // //                                 .validate()) {
 // //                               if (nameController.text.trim().isNotEmpty &&
 // //                                   emailController.text.trim().isNotEmpty &&
 // //                                   passController.text.trim().isNotEmpty &&
 // //                                   phoneController.text.trim().isNotEmpty &&
 // //                                   homeAddressController.text.trim().isNotEmpty) {
 //
 // //                               final createdUser =  UserModel(emailAddress: emailController.text.toString(),
 // //                                 name: nameController.text.toString(),
 // //                                 password: passController.text.toString(),
 // //                                 mobNo: phoneController.text.toString(),
 // //                                 gender: genderSave,
 // //                                 userId: FirebaseProvider.firebaseAuth.currentUser!.uid,
 // //                                 isOnline: false,
 // //                                 accountStatus: 1,
 // //                                 profilePicUrl: "added soon....",
 // //                                 profileStatus: 1
 // //                                 );
 //
 // //                                 /// firebase signup
 // //                                 ///
 // //                                 BlocProvider.of<ChatBloc>(context).add(CreateUserEvent(newUser: createdUser
 // //                                 , password: passController.text.toString()));
 // //                                  /// firebase signup
 //
 // //                               }
 // //                             }
 // //                           })),
 //
 // //  child: mcButton(
 // //                           name: "SignUp",
 // //                           onTap: () async {
 // //                             if (SignUpPage.signUpFormKey.currentState!
 // //                                 .validate()) {
 // //                               if (nameController.text.trim().isNotEmpty &&
 // //                                   emailController.text.trim().isNotEmpty &&
 // //                                   passController.text.trim().isNotEmpty &&
 // //                                   phoneController.text.trim().isNotEmpty &&
 // //                                   homeAddressController.text.trim().isNotEmpty) {
 //
 //
 //
 //
 //
 //
 //
 //
 //
 // /// Center(
 // //           child: SingleChildScrollView(
 // //             child: Form(
 // //               key: SignUpPage.signUpFormKey,
 // //               child: Column(
 // //                 children: [
 // //                   const Center(
 // //                       child: Text(
 // //                     "SignUp",
 // //                     style: TextStyle(fontSize: 22),
 // //                   )),
 // //                   SizedBox(height: mq.height * 0.025),
 // //                   InkWell(
 // //                     onTap: () {
 // //                       // calling class UserProfileState
 // //                       userPic(ImageSource.gallery, _updateProfilePic);
 // //                     },
 // //                     child: profilePic != null
 // //                         ? CircleAvatar(
 // //                             backgroundImage: FileImage(profilePic!),
 // //                             radius: 45,
 // //                           )
 // //                         : const CircleAvatar(
 // //                             radius: 45,
 // //                             backgroundColor: Colors.grey,
 // //                           ),
 // //                   ),
 // //                   SizedBox(height: mq.height * 0.025),
 // //                   mTextFormField(
 // //                       myValidator: (value) {
 // //                         if (value!.isEmpty) {
 // //                           return "this field is required dont empty";
 // //                         }
 // //                       },
 // //                       hint: "enter your name",
 // //                       keyboard: TextInputType.text,
 // //                       controller: nameController,
 // //                       mcColor: Colors.white70,
 // //                       mcBorder: BorderRadius.circular(12),
 // //                       mWidth: mq.width),
 // //                   SizedBox(height: mq.height * 0.025),
 // //                   Row(
 // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
 // //                     children: [
 // //                       const Text("Gender"),
 // //                       const Text("Male"),
 // //                       Radio.adaptive(
 // //                           value: genderOptionList[0],
 // //                           groupValue: selectedGender,
 // //                           onChanged: (value) {
 // //                             setState(() {
 // //                               selectedGender = value!;
 // //                               genderSave = value!;
 // //
 // //                               log("saved male to var $genderSave");
 // //                             });
 // //                           }),
 // //                       const Text("Female"),
 // //                       Radio.adaptive(
 // //                           value: genderOptionList[1],
 // //                           groupValue: selectedGender,
 // //                           onChanged: (value) {
 // //                             setState(() {
 // //                               selectedGender = value!;
 // //                               genderSave = value!;
 // //
 // //                               log("saved female to var $genderSave");
 // //                             });
 // //                           }),
 // //                       const Text("other"),
 // //                       Radio.adaptive(
 // //                           value: genderOptionList[2],
 // //                           groupValue: selectedGender,
 // //                           onChanged: (value) {
 // //                             setState(() {
 // //                               selectedGender = value!;
 // //                               genderSave = value!;
 // //
 // //                               log("saved other to var $genderSave");
 // //                             });
 // //                           }),
 // //                     ],
 // //                   ),
 // //                   SizedBox(height: mq.height * 0.025),
 // //                   mTextFormField(
 // //                       myValidator: (value) {
 // //                         if (value!.isEmpty) {
 // //                           return "your email is required";
 // //                         }
 // //                       },
 // //                       hint: "enter a email",
 // //                       keyboard: TextInputType.emailAddress,
 // //                       controller: emailController,
 // //                       mcColor: Colors.white70,
 // //                       mcBorder: BorderRadius.circular(12),
 // //                       mWidth: mq.width),
 // //                   SizedBox(height: mq.height * 0.025),
 // //                   mTextFormField(
 // //                     myValidator: (value) {
 // //                       if (value!.isEmpty) {
 // //                         return "password is required";
 // //                       } else if (value.length < 6) {
 // //                         return "at least password length is 6";
 // //                       }
 // //                     },
 // //                     hint: "enter a password",
 // //                     keyboard: TextInputType.text,
 // //                     controller: passController,
 // //                     mcColor: Colors.white70,
 // //                     mWidth: mq.width,
 // //                     mcBorder: BorderRadius.circular(12),
 // //                   ),
 // //                   SizedBox(height: mq.height * 0.025),
 // //                   mTextFormField(
 // //                       myValidator: (value) {
 // //                         if (value!.isEmpty) {
 // //                           return "phone number is required";
 // //                         } else if (value.length <= 9) {
 // //                           return "not valid mobile number";
 // //                         }
 // //                       },
 // //                       hint: "mobile number",
 // //                       keyboard: TextInputType.phone,
 // //                       controller: phoneController,
 // //                       mcColor: Colors.white70,
 // //                       mcBorder: BorderRadius.circular(12),
 // //                       mWidth: mq.width),
 // //                   SizedBox(height: mq.height * 0.025),
 // //                   mTextFormField(
 // //                       myValidator: (value) {
 // //                         if (value!.isEmpty) {
 // //                           return "enter home address";
 // //                         }
 // //                       },
 // //                       hint: "home address",
 // //                       keyboard: TextInputType.streetAddress,
 // //                       controller: homeAddressController,
 // //                       mcColor: Colors.white70,
 // //                       mcBorder: BorderRadius.circular(12),
 // //                       mWidth: mq.width),
 // //                   SizedBox(height: mq.height * 0.025),
 // //                   SizedBox(
 // //                       //  width: mq.width,
 // //                       child: BlocConsumer<ChatBloc, ChatStates>(
 // //                           listener: (context, state) {
 // //                     if (state is RegisterLoadedState) {
 // //                       Navigator.pushReplacement(
 // //                           context,
 // //                           MaterialPageRoute(
 // //                             builder: (context) => LoginPage(),
 // //                           ));
 // //                     } else if (state is RegisterErrorState) {
 // //                       ScaffoldMessenger.of(context).showSnackBar(
 // //                           SnackBar(content: Text(state.errorMsg)));
 // //                     }
 // //                   }, builder: (context, state) {
 // //                     if (state is RegisterLoadingState) {
 // //                       return const Center(
 // //                         child: CircularProgressIndicator(),
 // //                       );
 // //                     }
 // //
 // //                     return mcButton(
 // //                         name: "SignUp",
 // //                         onTap: () async {
 // //                           if (SignUpPage.signUpFormKey.currentState!
 // //                               .validate()) {
 // //                             if (nameController.text.trim().isNotEmpty &&
 // //                                 emailController.text.trim().isNotEmpty &&
 // //                                 passController.text.trim().isNotEmpty &&
 // //                                 phoneController.text.trim().isNotEmpty &&
 // //                                 homeAddressController.text.trim().isNotEmpty) {
 // //                               // email id for unique folder name for profile pic otherwise uuid package use niche child
 // //                               final savedPic = await FirebaseProvider
 // //                                   .firebaseStorage
 // //                                   .child("profilePic")
 // //                                   .child(emailController.text.trim().toString())
 // //                                   .putFile(profilePic!);
 // //
 // //                               final downloadImgUrl =
 // //                                   await savedPic.ref.getDownloadURL();
 // //
 // //                               log("signup btn pressed!!!");
 // //                               final createdUser = UserModel(
 // //                                   emailAddress: emailController.text.toString(),
 // //                                   name: nameController.text.toString(),
 // //                                   password: passController.text.toString(),
 // //                                   mobNo: phoneController.text.toString(),
 // //                                   gender: genderSave,
 // //                                   userId: FirebaseProvider
 // //                                       .firebaseAuth.currentUser!.uid,
 // //                                   isOnline: false,
 // //                                   accountStatus: 1,
 // //                                   profilePicUrl: downloadImgUrl,
 // //                                   profileStatus: 1);
 // //
 // //                               /// firebase signup
 // //                               ///
 // //                               BlocProvider.of<ChatBloc>(context).add(
 // //                                   CreateUserEvent(
 // //                                       email: emailController.text.toString(),
 // //                                       password:
 // //                                           passController.text.toString()));
 // //
 // //                               /// firebase signup
 // //
 // //                             }
 // //                           }
 // //                         });
 // //                   })),
 // //                 ],
 // //               ),
 // //             ),
 // //           ),
 // //         ),