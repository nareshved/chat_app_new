import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_routes/app_routes.dart';
import 'bloc/chat/register_bloc.dart';
import 'bloc/users/user_bloc.dart';
import 'firebase/firebase_provider.dart';
import 'firebase_options.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( MultiBlocProvider(


    providers: [
       BlocProvider(create: (context) => ChatBloc(
            firebaseProvider: RepositoryProvider.of<FirebaseProvider>(context), context: context),),

            BlocProvider(create: (context) => UserBloc(firebaseProvider: FirebaseProvider(), context: context),)
    ],

    child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}

