

import 'dart:io';

import 'package:fatima/Auth/helpers/auth_helper.dart';
import 'package:fatima/Auth/helpers/fire_Storage_helper.dart';
import 'package:fatima/Auth/helpers/fire_store_helper.dart';
import 'package:fatima/Auth/models/country_model.dart';
import 'package:fatima/Auth/models/register_requist.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  AuthProvider() {
    getCountriesFromFirestore();
  }

  resetControllers() {
    emailController.clear();
    passwordController .clear();
    cituController.clear();
    countryController.clear();
    firstNameController.clear();
    lastNameController.clear();
  }
  register() async {
    try {

      UserCredential userCredential = await AuthHelper.authHelper
          .signup(emailController.text.toString().trim(), passwordController.text);
      String imageUrl =
      await FirebaseStorageHelper.firebaseStorageHelper.uploadImage(file);

      RegisterRequest registerRequest = RegisterRequest(
          imageUrl: imageUrl,
          id: userCredential.user.uid,
          city: selectedCity,
          country: selectedCountry.name,
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
    try {
      UserCredential userCredinial = await AuthHelper.authHelper.signin(emailController.text.toString().trim(), passwordController.text);
      FirestoreHelper.firestoreHelper
          .getUserFromFirestore(userCredinial.user.uid);

      print("hi fatima login donre");
      resetControllers();
      tabController.animateTo(2);
    } on Exception catch (e) {
      print("hi fatima error is"+e.toString());

    }
  }
   checkLogin()async{
     IsSingIn = await AuthHelper.authHelper.test();

  }



  //**************************fireStorageWork*******************************
  List<CountryModel> countries;
  List<dynamic> cities = [];
  CountryModel selectedCountry;
  String selectedCity;
  selectCountry(CountryModel countryModel) {
    this.selectedCountry = countryModel;
    this.cities = countryModel.cities;
    selectCity(cities.first.toString());
    notifyListeners();
  }

  selectCity(dynamic city) {
    this.selectedCity = city;
    notifyListeners();
  }

  getCountriesFromFirestore() async {
    List<CountryModel> countries =
    await FirestoreHelper.firestoreHelper.getAllCountries();
    this.countries = countries;
    selectCountry(countries.first);
    notifyListeners();
  }

  ///upload Image
  File file;
  selectFile() async {
    XFile imageFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(imageFile.path);
    notifyListeners();
  }



}