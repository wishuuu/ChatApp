import 'package:chat_app_client/screens/homePage/home_page_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zaloguj się"),
      ),
      body: HomePageBody());
  }
}