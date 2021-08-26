import 'package:fatima/Auth/providers/AuthProvider.dart';
import 'package:fatima/Auth/ui/chats/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../WelcomePage.dart';
import 'Login/LoginScreen.dart';
import 'Signup/signup_screen.dart';
class AuthMainPage extends StatefulWidget {

  AuthMainPage({Key key}) : super(key: key);

  @override
  _AuthMainPageState createState() => _AuthMainPageState();
}

class _AuthMainPageState extends State<AuthMainPage> with SingleTickerProviderStateMixin{
  bool d;
  TabController tabController;
  @override
  void initState() {
    super.initState();

    bool x;
    Provider.of<AuthProvider>(context, listen: false).checkLogin();
   x = Provider.of<AuthProvider>(context, listen: false).IsSingIn;
    tabController= TabController(length: 3, vsync: this,initialIndex:x?2:1 );
    Provider.of<AuthProvider>(context, listen: false).tabController=tabController;

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
          ProfilePage(),
        ],
      ),
    );
  }
}
