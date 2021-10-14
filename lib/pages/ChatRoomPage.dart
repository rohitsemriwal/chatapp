import 'package:flutter/material.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({ Key? key }) : super(key: key);

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [

              // This is where the chats will go
              Expanded(
                child: Container(),
              ),

              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5
                ),
                child: Row(
                  children: [

                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter message"
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send, color: Theme.of(context).colorScheme.secondary,),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}