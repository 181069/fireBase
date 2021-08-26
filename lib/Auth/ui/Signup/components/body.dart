import 'package:fatima/Auth/models/country_model.dart';
import 'package:fatima/Auth/providers/AuthProvider.dart';
import 'package:fatima/Auth/ui/Login/LoginScreen.dart';
import 'package:fatima/Auth/ui/Signup/components/background.dart';
import 'package:fatima/Auth/ui/Signup/components/or_divider.dart';
import 'package:fatima/Auth/ui/Signup/components/social_icon.dart';
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
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),

              GestureDetector(
                onTap: () {
                  provider.selectFile();
                },
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.grey,
                  child: provider.file == null
                      ? Container()
                      : Image.file(provider.file, fit: BoxFit.cover),
                ),
              ),
              RoundedInputField(
                hintText: "Your Email",
                controller1: provider.emailController,
              ),
              RoundedPasswordField(
                controller: provider.passwordController,
              ),
              RoundedInputField(

                hintText: "Your fname",
                controller1: provider.firstNameController,
              ),
              RoundedInputField(
                hintText: "Your lname",
                controller1: provider.lastNameController,
              ),

              provider.countries == null
                  ? Container()
                  : Container(
                padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: DropdownButton<CountryModel>(
                  isExpanded: true,
                  underline: Container(),
                  value: provider.selectedCountry,
                  onChanged: (x) {
                    provider.selectCountry(x);
                  },
                  items: provider.countries.map((e) {
                    return DropdownMenuItem<CountryModel>(
                      child: Text(e.name),
                      value: e,
                    );
                  }).toList(),
                ),
              ),
              provider.countries == null
                  ? Container()
                  : Container(
                padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: DropdownButton<dynamic>(
                  isExpanded: true,
                  underline: Container(),
                  value: provider.selectedCity,
                  onChanged: (x) {
                    provider.selectCity(x);
                  },
                  items: provider.cities.map((e) {
                    return DropdownMenuItem<dynamic>(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
                ),
              ),

              RoundedButton(
                text: "SIGNUP",
                press: () {

                  provider.register();
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
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


