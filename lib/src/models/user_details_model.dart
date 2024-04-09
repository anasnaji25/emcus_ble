class UserDataModel {
  final String name;
  final String companyName;
  final String email;

  UserDataModel(
      {required this.name,
      required this.companyName,
      required this.email});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'companyName': companyName,
    };
  }

  UserDataModel.fromMap(Map<String, dynamic> userDataMap)
      : name = userDataMap["name"],
        email = userDataMap["email"],
        companyName = userDataMap["companyName"];
}