import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.grey[500],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Material(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your message...',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          CircleAvatar(
            backgroundColor: Colors.orangeAccent,
            child: Icon(
              Icons.mic,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
