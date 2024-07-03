
import 'package:chat_app_new/models/contact_model.dart';

abstract class UserEvents{} 



class ContactsUserEvent extends UserEvents {
  List<ContactModel> allContacts;

  ContactsUserEvent({required this.allContacts});
}