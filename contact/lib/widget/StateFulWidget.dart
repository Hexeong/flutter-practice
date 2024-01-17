import 'package:flutter/material.dart';
import './ListTile.dart';
import './FAB.dart';

class LView extends StatefulWidget {
  LView({super.key});

  @override
  State<LView> createState() => _LViewState();
}

class _LViewState extends State<LView> {
  var a = 1;
  var name = ['홍길동', '임꺽정', '끼발산'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text(a.toString()), // 버튼을 눌렀을 때 재 렌더링이 되지 않기에 버튼 Text는 변하지 않는다
        onPressed: (){
          setState(() {
            a++;
          });
        },
      ),
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, i) {
            return LTile(name: name[i]); // 값을 parameter로 보냄
          }),
    );
  }
}