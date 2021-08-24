import 'package:fatima/Auth/helpers/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AuthProvider extends ChangeNotifier{
  String email;
  TextEditingController  emailcontroller = TextEditingController();
  TextEditingController  passwordcontroller = TextEditingController();


  String password;
  register()async{
   AuthHelper.authHelper.signup(emailcontroller.text.toString().trim(), passwordcontroller.text);
  }

  login()async{
    AuthHelper.authHelper.signin(emailcontroller.text.toString().trim(), passwordcontroller.text);
  }

}