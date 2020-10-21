class MyUser {
  String uid;

  MyUser({uid});
}

class DataUserModel {
  String firstName;
  String lastName;
  String password;
  String email;

  DataUserModel({this.email, this.password});

  bool emailAndPasswordExist() {
    if (password.isEmpty && email.isEmpty) {
      return false;
    } else
      return true;
  }
}
