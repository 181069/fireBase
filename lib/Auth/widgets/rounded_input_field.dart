import 'package:fatima/Auth/widgets/constants.dart';
import 'package:fatima/Auth/widgets/text_field_container.dart';
import 'package:flutter/material.dart';


class RoundedInputField extends StatelessWidget {
   String hintText;
   IconData icon;
   TextEditingController controller1;

   RoundedInputField({

    this.controller1,
    this.hintText,
    this.icon = Icons.person,
  }) ;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller:controller1 ,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
