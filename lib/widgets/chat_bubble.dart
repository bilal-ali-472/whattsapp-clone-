import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/message.dart';

class ChatBubbleState extends StatefulWidget {
  @override
  State<ChatBubbleState> createState() => _ChatBubbleStateState();

Message message;



  ChatBubbleState({
required this.message
  });
}

class _ChatBubbleStateState extends State<ChatBubbleState> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.message.isSend!? Alignment.centerRight:Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 10, minWidth: 150),
        child: Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Color(0xffdcf8c6),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 6, right: 26, top: 5, bottom: 18),
                child: Text(widget.message.message.toString()),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      widget.message.time.toString(),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
