import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp/models/user.dart';
import 'package:whatsapp/widgets/chat_tile.dart';

class Chatlist extends StatefulWidget {
  const Chatlist({Key? key}) : super(key: key);

  @override
  State<Chatlist> createState() => _ChatlistState();
}

class _ChatlistState extends State<Chatlist> {
  List<User> Chatlist =[
User(
  avater: "https://cdn.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.webp",
  name: "Bilal",
  isGroup: false,
  updatedAt: "12.00 pm",
  message: "hello",
),
User(
  avater: "https://cdn.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.webp",
  name: "hafis",
  isGroup: false,
  updatedAt: "12.10 pm",
  message: "hello",
),
User(
  avater: "",
  name: "Hisham",
  isGroup: false,
  updatedAt: "12.00 pm",
  message: "hello",
),
User(
  avater: "",
  name: "flutter",
  isGroup: true,
  updatedAt: "12.10 pm",
  message: "hello",
),
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        ListView.builder(
          itemCount: Chatlist.length,
          itemBuilder: (BuildContext context, int index) {
            return  ChatTile(data: Chatlist[index]);
          },
        ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        child: SizedBox(
            height: 180,
            child: Icon(
              Icons.chat,
            )),
      ),
      
    );
  }
}
