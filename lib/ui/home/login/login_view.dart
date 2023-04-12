import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gellary/services/get_user_images.dart';
import 'package:gellary/services/upload_user_image.dart';
import '../../../base.dart';
import '../../../models/User.dart';
import '../../../services/login_user.dart';
import '../home_widget.dart';
import 'login_navigator.dart';
import 'login_view_model.dart';
import 'package:http/http.dart' as http;

class LoginView extends StatefulWidget {
  static String routeName = 'Login View';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseView<LoginView, LoginViewModel>
    implements LoginNavigator {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late bool visable;

  var email = TextEditingController();
  var password = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
    visable = false;
  }

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              // height: MediaQuery.of(context).size.height * 0.5,
              margin: EdgeInsets.only(
                 top: MediaQuery.of(context).size.height * 0.20,
                right: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.height * 0.05,
              ),
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('My\nGellary',style: TextStyle(
                color: Color(0xFF4A4A4A),
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),textAlign: TextAlign.center),
                  SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                  Text(
                    'LOG IN',
                    style: TextStyle(
                      color: Color(0xFF4A4A4A),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                  TextFormField(
                    validator: (text) {
                      if (text!.trim() == '') {
                        return "Please Enter Email";
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid) {
                        return "Please Enter Correct Email";
                      }
                      return null;
                    },
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Color.fromRGBO(36, 39, 43, 1.0),
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'User Name',
                      hintStyle: const TextStyle(
                          color: Color.fromRGBO(121, 121, 121, 1.0),
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                  TextFormField(
                    controller: password,
                    validator: (text) {
                      if (text!.trim() == '') {
                        return "Please Enter Password";
                      }
                      bool passwordValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    style: const TextStyle(
                      color: Color.fromRGBO(36, 39, 43, 1.0),
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                          color: Color.fromRGBO(121, 121, 121, 1.0),
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                  ElevatedButton(
                    onPressed: () {
                      ValidateForm();
                    },
                    child: Text(
                      'SUBMIT',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    style: ButtonStyle(
                      visualDensity: VisualDensity.comfortable,
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.only(
                              right: MediaQuery.of(context).size.width*0.24,
                            left: MediaQuery.of(context).size.width*0.24,
                            top: 12,
                            bottom: 12
                          ),
                      ),
                      shadowColor: MaterialStatePropertyAll(Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void ValidateForm() async {
     // if (formkey.currentState!.validate()) {
       LoginUser.LoginMyUser(
         email: 'gzieme@example.net',
         password: 'password',
       );
       Navigator.pushReplacementNamed(context, HomeWidget.routeName);
     //}

    // File file = File('assets/login.png');
    //   UploadUserImage.uploadImage('assets/login.png', file);


  }

  @override
  void goToHome(User myUser) {
     //var provider = Provider.of<MyProvider>(context,listen: false);
    // Navigator.pushReplacementNamed(context, HomeWidget.routeName);
  }
}
