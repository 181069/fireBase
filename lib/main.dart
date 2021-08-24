import 'package:fatima/Auth/providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'Auth/ui/AuthMainPage.dart';
import 'Auth/ui/Login/LoginScreen.dart';
import 'Auth/ui/Signup/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=> AuthProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirebasConfig(),
      ),
    );
  }
}

class FirebasConfig extends StatefulWidget {
  const FirebasConfig({Key key}) : super(key: key);

  @override
  _FirebasConfigState createState() => _FirebasConfigState();
}

class _FirebasConfigState extends State<FirebasConfig> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder:(context,provider,x){
      return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (context, AsyncSnapshot<FirebaseApp> dataSnapshot) {
          if (dataSnapshot.hasError) {
            return Scaffold(
              body: Container(
                child: Text("${dataSnapshot.error.toString()}"),
              ),
            );
          }
          if (dataSnapshot.connectionState == ConnectionState.done) {

            return AuthMainPage();
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      );

    });
  }
}
