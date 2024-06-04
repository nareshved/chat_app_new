class UserModel {
  String name;
  String emailAddress;
  String password;
// num phoneNumber;
  String? homeAddress;
  String userId;      /// assign to from firebase > credential.user!.uid
  String? mobNo;
  String? gender;
  bool isOnline = false;
  int? accountStatus = 1;   //1-> Active, 2->inActive, 3->Suspended
  String? profilePicUrl = "";
  int? profileStatus = 1;

  UserModel(
      {required this.emailAddress,
      this.homeAddress,
      required this.name,
      required this.password,
      required this.mobNo,
      required this.gender,
      required this.userId,
      required this.isOnline,
      required this.accountStatus,
      required this.profilePicUrl,
      required this.profileStatus});

// firenase model me map se map    from doc to model

  factory UserModel.fromDoc(Map<String, dynamic> documents) {
    return UserModel(
        userId: documents["userId"],

        /// get from firebase > credential.user!.uid
        emailAddress: documents["emailAddress"],
        accountStatus: documents["accountStatus"],
        isOnline: documents["isOnline"],
        profilePicUrl: documents["profilePicUrl"],
        profileStatus: documents["profileStatus"],
        homeAddress: documents["homeAddress"],
        name: documents["name"],
        password: documents["password"],
        mobNo: documents["mobNo"],
        gender: documents["gender"]);
  }

// creating for firebase doc data in map via model  model to map

  Map<String, dynamic> toDoc() {
    return {
      "emailAddress": emailAddress,
      "homeAddress": homeAddress,
      "name": name,
      "password": password,
      "mobNo": mobNo,
      "gender": gender,

      "userId": userId,

      /// get from firebase > credential.user!.uid
      "accountStatus": accountStatus,
      "isOnline": isOnline,
      "profilePicUrl": profilePicUrl,
      "profileStatus": profileStatus,
    };
  }
}
