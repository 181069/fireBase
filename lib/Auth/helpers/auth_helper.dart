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
  Future<UserCredential> signup(String Email, String Password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: Email, password: Password);
      print(userCredential.user.uid);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');

      }
      else if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      }

    } catch (e) {
      print(e);
    }
  }
  Future<UserCredential> signin(String Email, String Password) async {
    try {
      UserCredential userCredential = await  firebaseAuth.signInWithEmailAndPassword(email: Email, password: Password);
      print("fatima user check" +userCredential.user.uid);
      return userCredential;
    } on Exception catch (e) {
      print("fatima error" + e.toString());
    }
  }
  String getUserId(){
    return firebaseAuth.currentUser.uid;
  }
  verifyEmail() async {
    await firebaseAuth.currentUser.sendEmailVerification();
    print('verification email has been sent, please check your email');
  }
  logout() async {
    firebaseAuth.signOut();
  }

}
