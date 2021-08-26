import 'package:fatima/Auth/providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProfilePage extends StatefulWidget {
  //onst HomePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  Provider.of<AuthProvider>(context,listen:false).getUserFromFireStore();

  }
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage('images/batman.jpg'),
        )
      ],
    );
  }
}
