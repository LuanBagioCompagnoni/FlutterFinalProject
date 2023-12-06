import 'package:estacionamento/screens/Home.dart';
import 'package:flutter/material.dart';

import '../screens/Create.dart';
import '../screens/Lista.dart';
// Pages: Home, Edit, Details, Create

// Create a menu header with profile infos

Widget Menu(BuildContext context) {
  return Drawer(
      child: ListView(children: <Widget>[
    UserAccountsDrawerHeader(
      accountName: Text("conexão com API"),
      accountEmail: Text("api@api.com.br"),
      currentAccountPicture: CircleAvatar(
        child: Image.network(
          'https://cdn-icons-png.flaticon.com/512/17/17004.png',
        ),
        // Text(
        //   "Estacionamento",
        //   style: TextStyle(fontSize: 40.0),
        // ),
      ),
    ),
    ListTile(
      title: Text("Home"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      },
    ),
    ListTile(
      title: Text("Lista"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListaPage()),
        );
      },
    ),
    ListTile(
      title: Text("Create"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Create()),
        );
      },
    ),
  ]));
}
