import 'package:chat_app_client/screens/chatPage/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:signalr_netcore/utils.dart';
import 'package:chat_app_client/screens/homePage/widgets/build_popup_dialog.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({Key? key}) : super(key: key);

  late String ip = "";
  late String name = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // input box for ip
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter server address'),
            onChanged: (text) => {ip = text},
          ),
        ),
        // input box for name
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter your nickname'),
            onChanged: (text) => {name = text},
          ),
        ),
        // connect button
        OutlinedButton(
            onPressed: () => {
              if(isStringEmpty(ip) || isStringEmpty(name))
              {
                showDialog(context: context, builder: (BuildContext context) => buildPopupDialog(context, "Enter server address and nickname"),)
              }
              else
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(ip: ip, name: name),
                    ),
                  ),
                },
            child: const Text("Join server"))
      ],
    );
  }
}
