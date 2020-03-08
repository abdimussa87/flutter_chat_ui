import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/models/message_model.dart';
import 'package:flutter_chat_ui/models/user_model.dart';

class SingleChatScreen extends StatefulWidget {
  final User user;

  SingleChatScreen({this.user});
  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  String newText;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.user.name,
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, int index) {
                    Message currentMessage = messages[index];
                    return GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment:
                              currentMessage.sender == currentUser
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(25),
                              decoration: BoxDecoration(
                                borderRadius:
                                    currentMessage.sender == currentUser
                                        ? BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                          )
                                        : BorderRadius.only(
                                            topRight: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          ),
                                color: currentMessage.sender == currentUser
                                    ? Color(0xffF5EDE2)
                                    : Color(0xFFFFEFEE),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    currentMessage.time,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: 300,
                                    child: Text(
                                      currentMessage.text,
                                      style: TextStyle(
                                        letterSpacing: .6,
                                        color: Colors.blueGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            currentMessage.sender == currentUser
                                ? SizedBox.shrink()
                                : IconButton(
                                    iconSize: 30,
                                    icon: currentMessage.isLiked
                                        ? Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        : Icon(Icons.favorite_border),
                                    onPressed: () {
                                      setState(() {
                                        currentMessage.isLiked
                                            ? currentMessage.isLiked = false
                                            : currentMessage.isLiked = true;
                                      });
                                    },
                                  ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              width: 400,
              decoration: BoxDecoration(
                color: Color(0xFFFFEFEE),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListTile(
                leading: Icon(Icons.face),
                title: TextField(
                  controller: _controller,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: "Type your message...",
                    border: InputBorder.none,
                  ),
                  onSubmitted: (input) {
                    if (input.trim().isNotEmpty) {
                      Message newMessage = Message(
                        isLiked: false,
                        time: "Now",
                        text: input.trim(),
                        sender: currentUser,
                        unread: false,
                      );
                      setState(() {
                        messages.insert(0, newMessage);
                    // messages.add(newMessage);
                      _controller.clear();
                      });
                    }
                  },
                ),
                trailing: Icon(Icons.attach_file),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
