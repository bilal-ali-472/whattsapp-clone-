import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp/models/callList.dart';
import 'package:whatsapp/widgets/call_tile.dart';

class Call extends StatefulWidget {
   const Call({Key? key}) : super(key: key);
 

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  List<CallList> CalList =[
   
  CallList(
    avater:'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80',
     name: 'Hafis',
     calltime: '12:40 pm',
     calltype: 'outgoing',
     icon: 'audio',
   ),
   CallList(
    avater:'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80',
     name: 'Hisham',
     calltime: '12:40 pm',
     calltype: 'outgoing',
     icon: 'video',
   ),
   CallList(
    avater:'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80',
     name: 'Bilal',
     calltime: '12:40 pm',
     calltype: 'received',
     icon: 'video',
   ),
  ];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

body: ListView.builder(
  itemCount: CalList.length,
  itemBuilder: (BuildContext context, int index){
    return  CallTile(call: CalList[index]);
  }),

    );
  }
}