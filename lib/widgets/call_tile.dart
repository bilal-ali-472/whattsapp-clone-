import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp/models/callList.dart';

class CallTile extends StatefulWidget {
  CallTile({Key? key, required this.call}) : super(key: key);
  CallList call;
  @override
  State<CallTile> createState() => _CallTileState();
}

class _CallTileState extends State<CallTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(widget.call.name.toString()),
        subtitle: Row(
          children: [
            widget.call.calltype == 'received' ?
            Icon(Icons.call_received,color: Colors.green,size: 15,) : Icon(Icons.call_made,color: Colors.blue,size: 15,),
            Text('Yesterday'),
            
          ],
        ),
        
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.call.avater.toString()),
          
        ),
        trailing: widget.call.icon =='audio' ?
        Icon(Icons.call_outlined) :Icon(Icons.videocam_rounded),
        
        
        );
  }
}
