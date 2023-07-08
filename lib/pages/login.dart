import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/AppColors.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/const.dart';
import 'package:ses_finance/main_page.dart';
import 'package:ses_finance/widgets/PrimaryInputField.dart';
import 'package:ses_finance/widgets/primary_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();

  String _username = "abcd";
  String _password = "12345";

  String _usernameError = "";
  String _passwordError = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Image(
                image: AssetImage('assets/images/avatar.png'),
                width: 60,
              ),

              SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 5),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [

              BigText(
                //   isCentre: false,
                text: "Software Engineering Society",
                size: 20,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              SmallText(
                //     iscentre: false,
                text: "Arfa Kareem Block, university of Gujrat",
                size: 15,
                color: const Color.fromARGB(255, 202, 202, 202),
              ),

              SizedBox(
                height: 30,
              ),
              //     ],
              //   ),
              // )
            ],
          ),
          PrimaryInputField(
            onChange: () {
              setState(() {
                _usernameError = "";
              });
            },
            TextEditControl: _usernameCtrl,
            placeholderText: "Username/Email",
            PrefixIcon: Icons.account_circle,
            isPassword: false,
            ErrorMessage: _usernameError,
          ),
          SizedBox(
            height: 5,
          ),
          PrimaryInputField(
            onChange: () {
              setState(() {
                _passwordError = "";
              });
            },
            TextEditControl: _passwordCtrl,
            placeholderText: "Password",
            PrefixIcon: Icons.lock,
            isPassword: true,
            ErrorMessage: _passwordError,
          ),
          SizedBox(
            height: 5,
          ),
          PrimaryButton(
              TapAction: () {
                if (_usernameCtrl.text == "") {
                  setState(() {
                    _usernameError = "Username field can't be empty";
                  });
                } else if (_usernameCtrl.text != "") {
                  if (_usernameCtrl.text == _username) {
                    if (_passwordCtrl.text == "") {
                      setState(() {
                        _passwordError = "Password field can't be empty";
                      });
                    } else {
                      if (_passwordCtrl.text == _password) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPage()));
                      } else {
                        setState(() {
                          _passwordError =
                              "Password for ${_usernameCtrl.text} is incorrect";
                        });
                      }
                    }
                  } else {
                    setState(() {
                      _usernameError = "No such user Exists";
                    });
                  }
                }
              },
              text: "Login",
              color: AppColors.PrimaryColor,
              icon: Icons.login),
        ],
      ),
    ));
  }
}
