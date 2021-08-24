import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  AuthHelper._();

  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<bool> test() async{
    if (firebaseAuth.currentUser == null) {
    return false;
    }
    else {
     return true;
    }
  }
  signup(String Email, String Password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: Email, password: Password);
      print(userCredential.user.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return false;
      }
      else if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      }

    } catch (e) {
      print(e);
    }
  }
  signin(String Email, String Password) async {
    try {
      UserCredential userCredential = await  firebaseAuth.signInWithEmailAndPassword(email: Email, password: Password);
      print("fatima user check" +userCredential.user.uid);

    } on Exception catch (e) {
      print("fatima error" + e.toString());
    }
  }


}
