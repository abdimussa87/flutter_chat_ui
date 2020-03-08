import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/widgets/category_selector.dart';
import 'package:flutter_chat_ui/widgets/chats.dart';
import 'package:flutter_chat_ui/widgets/favorite_contacts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffFA3F2A),
          centerTitle: true,
          leading: IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          actions: <Widget>[
            IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
          title: Text(
            "Chat",
          )),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  Expanded(child: Chats()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
