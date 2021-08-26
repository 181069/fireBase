

import 'package:fatima/Auth/helpers/auth_helper.dart';
import 'package:fatima/Auth/helpers/fire_store_helper.dart';
import 'package:fatima/Auth/models/register_requist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthProvider extends ChangeNotifier{
  String email;
 bool IsSingIn=false;
  TextEditingController  emailController = TextEditingController();
  TextEditingController  passwordController  = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cituController = TextEditingController();
  TabController tabController;
  String password;
  resetControllers() {
    emailController.clear();
    passwordController .clear();
  }
  register() async {
    try {

      UserCredential userCredential = await AuthHelper.authHelper
          .signup(emailController.text.toString().trim(), passwordController.text);
      RegisterRequest registerRequest = RegisterRequest(
          id: userCredential.user.uid,
          city: cituController.text,
          country: countryController.text,
          email: emailController.text,
          fName: firstNameController.text,
          lName: lastNameController.text,
          password: passwordController.text);
      await FirestoreHelper.firestoreHelper.addUserToFirestore(registerRequest);
      await AuthHelper.authHelper.verifyEmail();
      await AuthHelper.authHelper.logout();
      tabController.animateTo(1);
    }catch(e){

    }

  }

  login()async{
    UserCredential userCredinial = await AuthHelper.authHelper.signin(emailController.text, passwordController.text);
    FirestoreHelper.firestoreHelper
        .getUserFromFirestore(userCredinial.user.uid);

    print("hi fatima login donre");
    resetControllers();
  }
   checkLogin()async{
     IsSingIn = await AuthHelper.authHelper.test();

  }

}