import 'package:assignment/widgets/drawer.dart';
import 'package:assignment/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageSB extends StatefulWidget {
  @override
  _HomePageSBState createState() => _HomePageSBState();
}

class _HomePageSBState extends State<HomePageSB> {
  // var myText = "Change me";

  Future getData() async {
    var url = "https://jsonplaceholder.typicode.com/photos";
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    print(data);
    return data;
  }

  Stream<List<String>> getStreamData() {
    var data = Stream<List<String>>.fromIterable(
        [List<String>.generate(20, (index) => "Item $index")]);
    return data;
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
      body: StreamBuilder(
        stream: getStreamData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text("Fetch Something"),
              );
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Some Error Occured"),
                );
              }
              return ListView.builder(
                //GridView.builder also use
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      title: Text(snapshot.data[index]["title"]),
                      subtitle: Text("ID: ${snapshot.data[index]["id"]}"),
                      leading: Image.network(snapshot.data[index]["url"]),
                    ),
                  );
                },
                itemCount: snapshot.data.length,
              );
          }
        },
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
