

import 'package:flutter/material.dart';
import 'package:whatsapp/models/user.dart';
import 'package:whatsapp/screens/chat_detailsscreen.dart';

class ChatTile extends StatefulWidget {
  ChatTile({required this.data});
  User data; // object of user class
  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetail(details: widget.data,),)),
      child: ListTile(
        title: Text(widget.data.name.toString()),
        subtitle: Row(children: [
          const Icon(
            Icons.done_all,
            color: Colors.blue,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(widget.data.message.toString()),
          ),
        ]),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            widget.data.avater == ''? 
            widget.data.isGroup == true ? 'https://lh3.googleusercontent.com/ABlX4ekWIQimPjZ1HlsMLYXibPo2xiWnZ2iny1clXQm2IQTcU2RG0-4S1srWsBQmGAo':
            'https://thumbs.dreamstime.com/z/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg':
            widget.data.avater.toString()),
          radius: 20,
        ),
        trailing: Text(widget.data.updatedAt.toString()),
      ),
    );
  }
}
