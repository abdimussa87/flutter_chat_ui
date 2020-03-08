import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/models/message_model.dart';
import 'package:flutter_chat_ui/models/user_model.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Favorite Contacts",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey,
                  letterSpacing: 1,
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                iconSize: 30,
                color: Colors.blueGrey,
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: favorites.length,
            itemBuilder: (context, int index) {
              User user = favorites[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(user.imageUrl),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: Text(
                        user.name,
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
