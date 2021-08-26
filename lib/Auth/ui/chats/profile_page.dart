import 'package:fatima/Auth/providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context,listen:false).getUserFromFireStore();
    String url=Provider.of<AuthProvider>(context,listen:false).user.imageUrl;
     print(url);
    return Scaffold(
      body:Container() ,
    );
  }
}
