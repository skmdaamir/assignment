import 'package:assignment/widgets/bg_image.dart';
import 'package:flutter/material.dart';

class ChangeNameCard extends StatelessWidget {
  const ChangeNameCard({
    Key key,
    @required this.myText,
    @required TextEditingController nameController,
  })  : _nameController = nameController,
        super(key: key);

  final String myText;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BgImage(),
        SizedBox(
          height: 20,
        ),
        Text(
          myText,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _nameController,
            keyboardType: TextInputType.text,
            // obscureText: true, For Password
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Something Here",
                labelText: "Name:"),
          ),
        ),
      ],
    );
  }
}