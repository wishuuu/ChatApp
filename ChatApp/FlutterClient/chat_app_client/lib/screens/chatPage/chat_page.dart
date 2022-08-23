import 'package:flutter/material.dart';

import 'chat_page_body.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key, required this.ip, required this.name}) : super(key: key);

  final String ip;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatApp"),
      ),
      body: ChatPageBody(ip:ip, name:name));
  }
}