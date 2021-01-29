import 'package:assignment/widgets/drawer.dart';
import 'package:assignment/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var myText = "Change me";
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome App'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, "/Login");
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: data != null
            ? ListView.builder(
                //GridView.builder also use
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      title: Text(data[index]["title"]),
                      subtitle: Text("ID: ${data[index]["id"]}"),
                      leading: Image.network(data[index]["url"]),
                    ),
                  );
                },
                itemCount: data.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //   myText = _nameController.text;
          //   setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
