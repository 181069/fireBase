import 'package:flutter/material.dart';

import '../WelcomePage.dart';
import 'Login/LoginScreen.dart';
import 'Signup/signup_screen.dart';
class AuthMainPage extends StatefulWidget {
   final Future<bool>  d;
  const AuthMainPage({Key key,this.d}) : super(key: key);

  @override
  _AuthMainPageState createState() => _AuthMainPageState();
}

class _AuthMainPageState extends State<AuthMainPage> with SingleTickerProviderStateMixin{
  TabController tabController;
  @override
  void initState() {
    super.initState();

    tabController= TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text('Main page'),
      bottom: TabBar(
        controller: tabController,

        tabs: [
          Tab(text: "register",),
          Tab(text: "LogIn",),
          Tab(text: "welcome",),

        ],
      ),
      ),
      body: TabBarView(

        controller: tabController,

        children: [
          SignUpScreen(),
          LoginScreen(),
          WelcomePage(),
        ],
      ),
    );
  }
}
