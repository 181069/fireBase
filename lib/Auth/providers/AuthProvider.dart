

import 'package:fatima/Auth/helpers/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AuthProvider extends ChangeNotifier{
  String email;
 bool IsSingIn=false;
  List<CountryModel> countries;
  List<dynamic> cities=[];
  CountryModel selectedCountry;
  String selectedCity;
  SelectedCountry(CountryModel countrymodel){
   this.selectedCountry=countrymodel;
   this.cities= CountryModel.cities;
   selectedCity(cities.first.toString());
   notifyListeners();
  }
  SelectedCity(dynamic city){
  this.selectedCity=city;
   notifyListeners();
  }
  getCountriesFromFireStore()async{


  }

  TextEditingController  emailcontroller = TextEditingController();
  TextEditingController  passwordcontroller = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cituController = TextEditingController();

  String password;
  register()async{
   AuthHelper.authHelper.signup(emailcontroller.text.toString().trim(), passwordcontroller.text);
  }

  login()async{
    AuthHelper.authHelper.signin(emailcontroller.text.toString().trim(), passwordcontroller.text);
  }
   checkLogin()async{
     IsSingIn = await AuthHelper.authHelper.test();

  }

}