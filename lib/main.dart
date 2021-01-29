import 'package:assignment/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:assignment/pages/home_page.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Awesome App",
    home: LoginPage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    routes: {
      "/Login": (context) => LoginPage(),
      "/home": (context) => HomePage(),
    },
  ));
}
