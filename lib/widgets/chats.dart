import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/models/message_model.dart';
import 'package:flutter_chat_ui/models/user_model.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, int index) {
                Message message = chats[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:
                          message.unread ? Color(0xFFFFEFEE) : Colors.white60,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                          message.sender.imageUrl,
                        ),
                        radius: 30,
                      ),
                      title: Text(message.sender.name),
                      subtitle: Text(
                        message.text,
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                      trailing: Column(
                        children: <Widget>[
                          Text(message.time),
                          SizedBox(
                            height: 10,
                          ),
                          message.unread
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.red,
                                  ),
                                  child: Text(
                                    "New",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ))
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
