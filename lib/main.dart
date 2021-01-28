import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Awesome App",
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
  ));
}
