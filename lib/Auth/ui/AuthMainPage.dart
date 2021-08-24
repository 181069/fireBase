import 'package:flutter/material.dart';

import 'Login/LoginScreen.dart';
import 'Signup/signup_screen.dart';
class AuthMainPage extends StatefulWidget {
  const AuthMainPage({Key key}) : super(key: key);

  @override
  _AuthMainPageState createState() => _AuthMainPageState();
}

class _AuthMainPageState extends State<AuthMainPage> with SingleTickerProviderStateMixin{
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController= TabController(length: 2, vsync: this);
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

        ],
      ),
      ),
      body: TabBarView(
        controller: tabController,

        children: [
          SignUpScreen(),
          LoginScreen(),
        ],
      ),
    );
  }
}
