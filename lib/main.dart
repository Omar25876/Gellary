import 'package:flutter/material.dart';
import 'package:gellary/ui/home/home_widget.dart';
import 'package:gellary/ui/home/login/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginView.routeName : (context) => LoginView(),
        HomeWidget.routeName : (context)=>HomeWidget(),
      },
      initialRoute:LoginView.routeName ,

    );
  }
}

