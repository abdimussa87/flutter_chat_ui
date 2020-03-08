import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/screens/home_sceen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat UI',
      theme: ThemeData(
        primaryColor: Color(0xffFA3F2A),
        accentColor: Color(0xffEFE7DB),
      ),
      home: HomeScreen(),
    );
  }
}


