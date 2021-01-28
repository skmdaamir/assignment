import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    title: "Awesome App",
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome App'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          color: Colors.teal,
          width: 100,
          height: 100,
          child: Text('I am a Box'),
        ),
      ),
    );
  }
}
