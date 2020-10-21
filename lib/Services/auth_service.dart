import 'package:Kchat/models/user_models.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithEmailAndPassword({String email, String password}) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      print('result: ${user.uid}');
      return myUserFromFireUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  MyUser myUserFromFireUser(User fireBaseUser) {
    return MyUser(uid: fireBaseUser.uid);
  }
}
