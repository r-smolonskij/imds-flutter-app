import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _dialogBuilder(BuildContext context) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Basic dialog title'),
            content: const Text('A dialog is a type of modal window that\n'
                'appears in front of app content to\n'
                'provide critical information, or prompt\n'
                'for a decision to be made.'),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(),
                child: const Text('Disable'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(),
                child: const Text('Enable'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
