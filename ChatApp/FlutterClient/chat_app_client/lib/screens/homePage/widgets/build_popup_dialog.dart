import 'package:flutter/material.dart';

Widget buildPopupDialog(BuildContext context, String message) {
  return AlertDialog(
    title: const Text('Popup'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(message),
      ],
    ),
    actions: <Widget>[
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}
