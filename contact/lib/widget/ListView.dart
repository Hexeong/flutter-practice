import 'package:flutter/material.dart';
import './ListTile.dart';
import './FAB.dart';

class LView extends StatelessWidget {
  const LView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FAB(),
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, i) {
            return LTile(name: "홍길동");
          }),
    );
  }
}
