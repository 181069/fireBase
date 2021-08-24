import 'package:fatima/Auth/providers/AuthProvider.dart';
import 'package:fatima/Auth/ui/Login/components/background.dart';
import 'package:fatima/Auth/ui/Login/components/or_divider.dart';
import 'package:fatima/Auth/ui/Login/components/social_icon.dart';
import 'package:fatima/Auth/ui/Signup/signup_screen.dart';
import 'package:fatima/Auth/widgets/already_have_an_account_acheck.dart';
import 'package:fatima/Auth/widgets/rounded_button.dart';
import 'package:fatima/Auth/widgets/rounded_input_field.dart';
import 'package:fatima/Auth/widgets/rounded_password_field.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Consumer<AuthProvider>(builder:(context,provider,x){
         return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              // SvgPicture.asset(
              //   "assets/icons/signup.svg",
              //   height: size.height * 0.35,
              // ),
              RoundedInputField(
                hintText: "Your Email",
                controller1: provider.emailcontroller,
              ),
              RoundedPasswordField(
              controller: provider.passwordcontroller,
              ),
              RoundedButton(
                text: "SIGNIN",
                press: () {
                  provider.login();
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        );
      } ,),
    );
  }
}



