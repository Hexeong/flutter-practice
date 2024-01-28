import 'package:flutter/material.dart';

class Homework2 extends StatelessWidget {
  const Homework2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 이 밑에 메인 페이지 디자인하는 것 : 위젯 짜집기로
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("금호동3가"),
            actions: [
              Icon(Icons.search),
              Icon(Icons.menu),
              Icon(Icons.notifications_none_outlined)
            ],
          ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Image.asset('assets/dog.jpg', width: 100, height: 100,),
                Expanded(child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("도지 코인 1000개"),
                  Text("전북 남원"),
                  Text("200,000,000원"),
                  Container(
                    child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Icon(Icons.favorite_border),
                      Text('4')
                    ],),)
                ],), padding: EdgeInsets.fromLTRB(5, 0, 5, 0),))
              ],),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5)
                ),
                padding: EdgeInsets.all(5),),

              Container(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Image.asset('assets/carrot.png', width: 100, height: 100,),
                Expanded(child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("신선한 당근 100개"),
                  Text("전북 남원"),
                  Text("200,000원"),
                  Container(
                    child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Icon(Icons.favorite_border),
                      Text('4')
                    ],),)
                ],), padding: EdgeInsets.fromLTRB(5, 0, 5, 0),))
              ],),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5)
                ),
                padding: EdgeInsets.all(5),)
            ],
          ),
        )
    );
  }
}