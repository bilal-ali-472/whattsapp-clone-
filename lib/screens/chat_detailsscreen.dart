import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/models/user.dart';
import 'package:whatsapp/widgets/chat_bubble.dart';


import '../models/message.dart';

class ChatDetail extends StatefulWidget {
  ChatDetail({Key? key, required this.details}) : super(key: key);
  User details;
TextEditingController _msg_cntrl = TextEditingController();
  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  bool Show_send = false;
  bool show_emoji = false;
  FocusNode focusNode = FocusNode();
  List<Message> messageList = [
    Message(isSend: true, message: 'hai', time: '12:45'),
    Message(isSend: true, message: 'hlooo', time: '12:45'),
    Message(isSend: false, message: 'hlokjgfgoo', time: '12:35'),
    Message(isSend: false, message: 'hlohfdgiuhfoo', time: '12:15'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        titleSpacing: 0,
        leadingWidth: 80,
        leading: Row(
          children: [
            GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(
              width: 3,
            ),
            //IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back)),
            CircleAvatar(
              backgroundImage: NetworkImage(
                widget.details.avater == ''
                    ? widget.details.isGroup == true
                        ? 'https://lh3.googleusercontent.com/ABlX4ekWIQimPjZ1HlsMLYXibPo2xiWnZ2iny1clXQm2IQTcU2RG0-4S1srWsBQmGAo'
                        : 'https://thumbs.dreamstime.com/z/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg'
                    : widget.details.avater.toString(),
              ),
              radius: 20,
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.details.name.toString()),
            Text(
              'last seen ${widget.details.updatedAt.toString()}',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        actions: [
          const Icon(Icons.call_end_rounded),
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.video_call_rounded),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                  child: widget.details.isGroup == true
                      ? Text('Group info')
                      : Text('view contact')),
              PopupMenuItem(
                  child: widget.details.isGroup == true
                      ? Text('Group Media')
                      : Text('Media,Links and docs')),
              PopupMenuItem(child: Text('Search')),
              PopupMenuItem(child: Text('Mute notification')),
              PopupMenuItem(child: Text('Disappearing messages')),
              PopupMenuItem(child: Text('Walpaper')),
              PopupMenuItem(child: Text('More')),
            ];
          }),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://i.pinimg.com/474x/8f/b4/59/8fb4595307a2ad198fff92899d69ccb7.jpg'))),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (((context, index) => ChatBubbleState(
                    message: messageList[index],
                  ))),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: widget._msg_cntrl,
                        onTap: () {
                          if (show_emoji) {
                            focusNode.unfocus();
                          }
                          print('----------------------');
                          print(show_emoji);
                        },
                        focusNode: focusNode,
                        onChanged: (value) {
                          print(value.length);
                          if (value.length > 0) {
                            setState(() {
                              Show_send = true;
                            });
                          } else {
                            setState(() {
                              Show_send = false;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          prefixIconColor: Colors.grey,
                          suffixIcon: showIcons(),
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 20),
                          hintText: 'Message',
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: IconButton(
                              icon: Icon(show_emoji
                                  ? Icons.keyboard
                                  : Icons.emoji_emotions_outlined),
                              onPressed: () {
                                focusNode.unfocus();
                                setState(() {
                                  show_emoji = !show_emoji;
                                });
                                if (!show_emoji) {
                                  focusNode.requestFocus();
                                }
                              },
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // FloatingActionButton(onPressed: (){},child: Icon(Icons.mic),)
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          print(widget._msg_cntrl);
                          setState(() {
                            messageList.add(Message(message: widget._msg_cntrl.text,isReaded: false,isSend: true,time: '12:34'));
                          });
                          widget._msg_cntrl.clear();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.teal,
                          child: Icon(Show_send ? Icons.send : Icons.mic),
                        ),
                      ),
                    )
                  ],
                ),
                show_emoji ? select_emoji() : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row showIcons() {
    if (Show_send) {
      return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context, builder: (Builder) => menu());
              },
              icon: Icon(Icons.attach_file),
              color: Colors.grey,
            ),
            // Icon(Icons.camera_alt)
          ]);
    } else {
      return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context, builder: (Builder) => menu());
              },
              icon: Icon(Icons.attach_file),
              color: Colors.grey,
            ),
            Icon(
              Icons.camera_alt,
              color: Colors.grey,
            )
          ]);
    }
  }

  Container menu() {
    return Container(
      child: Card(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                    Icon(Icons.insert_drive_file), 'document', Colors.indigo),
                iconWidget(Icon(Icons.camera_alt), 'camera', Colors.pink),
                iconWidget(Icon(Icons.insert_photo), 'gallery', Colors.purple),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(Icon(Icons.headset), 'Audio', Colors.orange),
                iconWidget(Icon(Icons.location_pin), 'location', Colors.teal),
                iconWidget(Icon(Icons.contact_phone), 'Contacts', Colors.blue)
              ],
            )
          ],
        ),
      ),
      height: 270,
    );
  }

  GestureDetector iconWidget(Icon icon, String text, Color color) {
    return GestureDetector(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: icon,
            radius: 30,
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget select_emoji() {
    return EmojiPicker(
      onEmojiSelected: (emoji, category) {
        widget._msg_cntrl.text += emoji.emoji;
      },
    );
  }
}








// ListView(
            //   children: [
            //     SendMesssage(
            //       sendText: 'hlo',
            //       sentTime: '12:35',
            //       isRead: true,
            //     ),
            //     SendMesssage(
            //       sendText: 'evide',
            //       sentTime: '12:45',
            //       isRead: false,
            //     ),
            //     ReceivedMesage(
            //         ReceivedText: 'evidea und', ReceivedTime: '12:50'),
            //     ReceivedMesage(
            //         ReceivedText: 'endha paripadi', ReceivedTime: '12:52'),
            //   ],
            // ),