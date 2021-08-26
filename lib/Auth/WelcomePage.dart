import 'package:flutter/material.dart';

import 'helpers/fire_store_helper.dart';
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key
  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(child:
      RaisedButton(onPressed: () {
    FirestoreHelper.firestoreHelper.getAllUsersFromFirestore();
    }), ) ,
    );
  }
}
