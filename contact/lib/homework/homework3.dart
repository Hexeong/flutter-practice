import 'package:flutter/material.dart';

class Homework3 extends StatelessWidget {
  const Homework3({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
     Container(
       padding: EdgeInsets.all(5),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Container(
             width: 40,
             height: 40,
             margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
             child: Image.asset('profile.png'),),
           Expanded(
             child: Text('홍길동'), )
         ],),),
      Container(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Image.asset('profile.png'),),
            Expanded(
              child: Text('홍길동'), )
          ],),),
      Container(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Image.asset('profile.png'),),
            Expanded(
              child: Text('홍길동'), )
          ],),)
    ],);
  }
}
