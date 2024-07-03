
class ContactModel {
  String? userId;
  String? name;
  String? email;
  String? mobNo;

  ContactModel({
      this.userId,
      required this.name,
      required this.email,
      required this.mobNo,
      }); //1-> public, 2->private, 3->onlyFriends



  factory ContactModel.fromDoc(Map<String, dynamic> document) {
    return ContactModel(
      name: document['name'],
      email: document['email'],
      mobNo: document['mobNo'],
      
    );
  }

  Map<String, dynamic> toDoc() => {
    "name" : name,
    "email" : email,
    "mobNo" : mobNo,
  
  };
}
