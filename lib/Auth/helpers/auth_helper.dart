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

  Future<UserCredential> signin(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomDialoug.customDialoug
            .showCustomDialoug('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CustomDialoug.customDialoug
            .showCustomDialoug('Wrong password provided for that user.');
      }
    }
  }

  resetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    CustomDialoug.customDialoug.showCustomDialoug(
        'we have sent email for reset password, please check your email');
  }

  verifyEmail() async {
    await firebaseAuth.currentUser.sendEmailVerification();
    CustomDialoug.customDialoug.showCustomDialoug(
        'verification email has been sent, please check your email');
  }

  logout() async {
    firebaseAuth.signOut();
  }

  bool checkEmailVerification() {
    return firebaseAuth.currentUser?.emailVerified ?? false;
  }

}
