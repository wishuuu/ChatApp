import 'package:flutter/material.dart';
import 'package:signalr_netcore/errors.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class ChatPageBody extends StatefulWidget {
  ChatPageBody({Key? key, required this.ip, required this.name}) : super(key: key)
  {
      hubConnection = HubConnectionBuilder().withUrl(ip).build();
  }

  final String ip;
  final String name;

  late HubConnection hubConnection;

  @override
  State<ChatPageBody> createState() => _ChatPageBodyState();
}

class _ChatPageBodyState extends State<ChatPageBody> {
  late String message = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children: generateMessageWidgets(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            children: [
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your message'),
                onChanged: (text) => {message = text},
              ),
              OutlinedButton(
                onPressed: () => {throw NotImplementedException()},
                child: const Text("Send message"),
              )
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> generateMessageWidgets() {
    return [];
  }
}
