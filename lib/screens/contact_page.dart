
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/users/user_bloc.dart';
import '../bloc/users/user_states.dart';


class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("my contacts"),
      ),

      body: BlocBuilder<UserBloc, UserStates>(
        builder: (context, state) {
        if(state is UserLoadingState){
          return const Center(child: CircularProgressIndicator());
        } 
        
        else if(state is UserErrorState) {
          return Text(state.errorMsg);
        }
        else if(state is UserLoadedState) {

        // Future<QuerySnapshot<Map<String, dynamic>>> allUsers =  FirebaseProvider.contactsFromFirebase();
          // List<Contact model> = all;

          return ListView.builder(
            itemCount: 22,
            itemBuilder: (context, index) {
            
              return   ListTile(
            title: Text("${state.allusers[index].email}")
              );
            },
            );
        }
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