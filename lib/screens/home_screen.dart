import 'package:flutter/material.dart';
import 'package:whatsapp/models/callList.dart';
import 'package:whatsapp/screens/call_list.dart';
import 'package:whatsapp/screens/camera.dart';
import 'package:whatsapp/screens/chat_list.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _tb;
  @override
  void initState() {
    super.initState();
    _tb = TabController(length: 4, initialIndex: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          bottom: TabBar(tabs: [
           const Tab(
              icon: Icon(Icons.camera_alt),
            ),
          const  Tab(
              text: 'CHATS',
            ),
           const Tab(
              text: 'STATUS',
            ),
            const Tab(
             text: 'CALL', 
            ),
          ],
          controller: _tb,
          
          ),
          
          
      actions: [
        
        Icon(Icons.search),
        PopupMenuButton(itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
              child: Text('New Group'),
              value: 1,
            ),
            PopupMenuItem(
              child: Text('New broadcast'),
              value: 2,
            ),
            PopupMenuItem(
              child: Text('Linked devices'),
              value: 3,
            ),
            PopupMenuItem(
              child: Text('Shared message'),
              value: 4,
            ),
            PopupMenuItem(
              child: Text('Payments'),
              value: 5,
            ),
            PopupMenuItem(
              child: Text('Settings'),
            )
          ];
        }),
      ],
      title: Text(
        'whatsapp',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.teal,
    ),
    body: TabBarView(children: [
      CameraScreen(),
    Chatlist(),
     const Text('Status'),
      Call(),
      
    ],
    controller: _tb,
    ),
    );
  }
}
