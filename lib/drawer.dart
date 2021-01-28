import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        // DrawerHeader(
        //   child: Text(
        //     'Hi I am Drawer',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   decoration: BoxDecoration(color: Colors.purple),
        // ),
        UserAccountsDrawerHeader(
          accountName: Text('Amir Shaikh'),
          accountEmail: Text('skmdaamir29@gmail.com'),
          currentAccountPicture: CircleAvatar(
            backgroundImage:
                NetworkImage('https://unsplash.com/photos/S7nzSaoMQi4'),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Account"),
          subtitle: Text("Person"),
          trailing: Icon(Icons.edit),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text("Account"),
          subtitle: Text("skmdaamir29@gmail.com"),
          trailing: Icon(Icons.send),
        ),
        ListTile(
          leading: Icon(Icons.outbox),
          title: Text("Outbox"),
          subtitle: Text("skmdaamir29@gmail.com"),
          trailing: Icon(Icons.outbox),
        ),
        ListTile(
          leading: Icon(Icons.login),
          title: Text("Account"),
          subtitle: Text("skmdaamir29@gmail.com"),
          trailing: Icon(Icons.login),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Account"),
          subtitle: Text("skmdaamir29@gmail.com"),
          trailing: Icon(Icons.logout),
        )
      ],
    )); //For Creating Hamburger Menu
  }
}
