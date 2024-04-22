
import 'package:flutter/material.dart';

Future<bool?> confirmDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        title: const Text('Log out'),
        content: const Text('Do you want to log out?'),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context, true);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: (){
              Navigator.pop(context, null);
            },
            child: const Text('No'),
          ),
        ],
      );
    },
  );
}