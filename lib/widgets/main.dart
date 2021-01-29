import 'package:assignment/pages/login_page.dart';
import 'package:assignment/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:assignment/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Awesome App",
    // home: LoginPage(),
    home:
        Constants.prefs.getBool("loggedIn") == true ? HomePage() : LoginPage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    routes: {
      "/Login": (context) => LoginPage(),
      "/home": (context) => HomePage(),
    },
  ));
}
