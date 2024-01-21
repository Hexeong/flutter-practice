import 'package:flutter/material.dart';

class DialogUI extends StatelessWidget {
  const DialogUI({super.key, this.state, this.plusA});
  final state;
  final plusA;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Title'),
      content: Text('a++'),
      actions: [
        ElevatedButton(
            onPressed: () {
              plusA();
            },
            child: Text('완료')
        )
      ],
    );
  }
}
