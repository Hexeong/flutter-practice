import 'package:flutter/material.dart';
import '../widget/DialogUI.dart';

class Homework6 extends StatefulWidget {
  const Homework6({super.key});

  @override
  State<Homework6> createState() => _Homework6State();
}

class _Homework6State extends State<Homework6> {
  var a = 0;

  plusA() {
    setState(() {
      a++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('Button'),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogUI(plusA: plusA);
              });
        },
      ),
      body: Text(a.toString()),
    );
  }
}
