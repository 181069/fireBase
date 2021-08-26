import 'package:fatima/Auth/providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProfilePage extends StatefulWidget {


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context,listen:false).getUserFromFireStore();
    String url=Provider.of<AuthProvider>(context,listen:false).user.imageUrl;
    print(url);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
