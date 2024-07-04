
import 'dart:developer';

import 'package:chat_app_new/bloc/users/user_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/users/user_bloc.dart';
import '../bloc/users/user_states.dart';


class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(ContactsUserEvent());
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("my contacts"),
      ),

      body: BlocBuilder<UserBloc, UserStates>(
        builder: (context, state) {
            log(state.toString());

        if(state is UserLoadingState){
          return const Center(child: CircularProgressIndicator());
        } 
        
        else if(state is UserErrorState) {
          return Text(state.errorMsg);
        }
        else if(state is UserLoadedState){

          return ListView.builder(
            itemCount: 22,
            itemBuilder: (context, index) {
            

            
              return ListTile();
            },
            );
        }

  log(state.toString());
        
        return const Center(child: Text("error found in bloc"));
      }    
      )
    );
  }

  
}




































// BlocBuilder<RegisterBloc, RegisterState>(
//         builder: (context, state) {
//         if(state is UserLoadingState){
//           return const Center(child: Text("error fund in bloc"));
//         } 
        
//         else if(state is UserErrorState) {
//           return Text(state.errorMsg);
//         }
//         else if(state is UserLoadedState) {
//           return ListView.builder(
//             itemCount: ,
//             itemBuilder: (context, index) {
              
//               return const ListTile();
//             },
//             );
//         }
//         return const Center(child: Text("error found in bloc"));
//       }    
//       )