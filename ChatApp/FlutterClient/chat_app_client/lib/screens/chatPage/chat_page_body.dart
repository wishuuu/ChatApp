import 'package:flutter/material.dart';
import 'package:signalr_netcore/errors.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

import '../../models/message.dart';
import '../../services/message_service.dart';
import '../../services/observer.dart';
import '../homePage/widgets/build_popup_dialog.dart';

class ChatPageBody extends StatefulWidget {
  ChatPageBody({Key? key, required this.ip, required this.name}) : super(key: key)
  {
      hubConnection = HubConnectionBuilder().withUrl(ip).build();
      
      hubConnection.on('Message', (message) => { 
        (
          messageService.addMessage(Message.fromJson(message?[0] as Map<String, dynamic>))
      )});

      hubConnection.start();
    }

  final String ip;
  final String name;

  final MessageService messageService = MessageService();
  late HubConnection hubConnection;

  @override
  State<ChatPageBody> createState() => _ChatPageBodyState();
}

class _ChatPageBodyState extends State<ChatPageBody> with Observer {
  late String message = "";

  

  @override
  Widget build(BuildContext context) {

    MessageService().addObserver(this);

    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children: generateMessageWidgets(),
            //children: [Container(width: 100, color: Colors.red,)],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            children: [
              SizedBox(
                width: 500,
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your message'),
                  onChanged: (text) => {message = text},
                ),
              ),
              OutlinedButton(
                onPressed: () => {
                  if(message.isEmpty)
                  {
                    showDialog(context: context, builder: (BuildContext context) => buildPopupDialog(context, "Enter your message"),)
                  }
                  else
                  {
                    widget.hubConnection.invoke('SendMessage', args: [Message.params(sender: widget.name, text: message)]),
                    MessageService().addMessage(Message.params(sender: widget.name, text: message)),
                    message = "",
                  }
                },
                child: const Text("Send message"),
              )
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> generateMessageWidgets() {
    List<Widget> widgets = [];

    var service = MessageService();

    for (int i=0; i<service.messages.length; i++) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              Text(
                "${service.messages[i].sender as String}: ",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(service.messages[i].text as String),
            ],
          ),
        ),
      );
    }

    return widgets;
  }
  
  @override
  void update() {
    setState(() {});
  }
}
