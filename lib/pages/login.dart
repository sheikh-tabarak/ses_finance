// ignore_for_file: prefer_final_fields, use_build_context_synchronously, deprecated_member_use, unused_field, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/AppColors.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/main_page.dart';
import 'package:ses_finance/models/user.dart';
import 'package:ses_finance/pages/loading.dart';
import 'package:ses_finance/widgets/PrimaryInputField.dart';
import 'package:ses_finance/widgets/message_bar.dart';
import 'package:ses_finance/widgets/primary_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String sheikhtabarak = 'https://sheikhtabarak.me/';
  Future<void>? _launched;
  bool _isError = false;
  String _Error = "";
  bool _isLoading = false;

  TextEditingController _usernameCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();

  // String _username = "tabarakyaseen46@gmail.com";
  // String _password = "sesfinance@sheikhtabarak.me";

  String _usernameError = "";
  String _passwordError = "";

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? Scaffold(body: Loading())
        : Scaffold(
            body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/avatar.png'),
                      width: 60,
                    ),

                    const SizedBox(
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
                    const SizedBox(
                      height: 10,
                    ),
                    SmallText(
                      //     iscentre: false,
                      text: "Arfa Kareem Block, university of Gujrat",
                      size: 15,
                      color: const Color.fromARGB(255, 202, 202, 202),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    _isError == true
                        ? Container(
                            width: 300,
                            child: MessageBar(message: _Error, message_type: 1),
                          )
                        : const SizedBox(
                            height: 0,
                          ),

                    const SizedBox(
                      height: 15,
                    ),

                    //     ],
                    //   ),
                    // )
                  ],
                ),
                PrimaryInputField(
                  onChange: () async {
                    setState(() {
                      _isError = false;
                    });
                  },
                  TextEditControl: _usernameCtrl,
                  placeholderText: "Username/Email",
                  PrefixIcon: Icons.account_circle,
                  isPassword: false,
                  ErrorMessage: "",
                ),
                const SizedBox(
                  height: 5,
                ),
                PrimaryInputField(
                  onChange: () {
                    setState(() {
                      _isError = false;
                    });
                  },
                  TextEditControl: _passwordCtrl,
                  placeholderText: "Password",
                  PrefixIcon: Icons.lock,
                  isPassword: true,
                  ErrorMessage: "",
                ),
                const SizedBox(
                  height: 5,
                ),
                PrimaryButton(
                    TapAction: () async {
                      setState(() {
                        _isLoading = true;
                      });

                      if (_usernameCtrl.text == "" ||
                          _passwordCtrl.text == "") {
                        setState(() {
                          _isLoading = false;
                          _Error = "Username/Password Empty";
                          _isError = true;
                        });
                      } else {}
                      // if (_usernameCtrl.text != "" &&
                      //     await FirebaseAuth.instance.currentUser!.email ==
                      //         _usernameCtrl.text) {
                      //   if (_passwordCtrl.text == "") {
                      //     //  } else {
                      //     setState(() {
                      //       _isLoading = false;
                      //       _passwordError =
                      //           "Password for ${_usernameCtrl.text} is incorrect";
                      //     });
                      //     //  }
                      //   } else {
                      bool isAuthenticated =
                          await signIn(_usernameCtrl.text, _passwordCtrl.text);

                      if (isAuthenticated == true) {
                        setState(() {
                          _isLoading = false;
                          _isError = false;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPage(
                                      homePageIndex: 0,
                                      eventPageIndex: 0,
                                    )));
                      } else {
                        setState(() {
                          _isLoading = false;
                          _Error = "Username/Password Incorrect";
                          _isError = true;
                        });
                      }
                    },

                    // if (_usernameCtrl.text == _username) {

                    // else {
                    //   setState(() {
                    //     _usernameError = "No such user Exists";
                    //   });
                    // }

                    text: "Login",
                    color: AppColors.PrimaryColor,
                    icon: Icons.login),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(text: "Developed by"),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _launched = _launchInBrowser(sheikhtabarak);
                        });
                      },
                      child: SmallText(text: "Muhammad Tabarak"),
                    ),
                  ],
                )
              ],
            ),
          ));
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
