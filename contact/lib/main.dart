import 'package:flutter/material.dart';
import './homework/homework4.dart';

void main() {
  runApp(const MyApp()); // 앱 시작하는 함수 runApp, 파라미터로 메인페이지를 넘겨주기
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 이 밑에 메인 페이지 디자인하는 것 : 위젯 짜집기로
    return MaterialApp(
      home: Homework4(),
    );
  }
}

// Center(
//  child: Container(width: 50, height: 50, color: Colors.blue) // or SizedBox()
// )
// 단위 LP
// 텍스트 : Text() -> parameter로 style : TextStyle(color : Colors.red) 로 스타일 변경 가능
// -> 말고도 background, fontSize, fontWeight: FontWeight.w700, fontFamily, letterSpacing
// Icon : Icon(Icons.shop)
// Image : Image.asset("경로")
// 박스 : Container(), SizedBox()

// 만약 Center말고 좌상단, 우상단시 어떻게 해야 좋을까?
// Align(
// alignment : Alignment.bottomLeft,
// child : Container( width : 50, height : 50, color : Colors.blue )
// )

//만약 Container에서 height와 width만 사용할 것이면 SizedBox를 쓰는 게 좋음. 보다 가볍기 때문

// Container에 여백 주는 법, Row(), Column()에는 안됨
// Padding위젯 또한 존재
//margin: EdgeInsets.all(30),
//padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
//위의 속성으로 위치 조정 까지 가능

// 가로폭 꽉차게 하기 : Container( width : double.infinity, height : 50, color : Colors.blue )

// Container 스타일링에서 찌끄레기 스타일 주기
// Container(
// decoration : BoxDecoration(
// border : Border.all(color : Colors.black)
// )
// )

// Button 사용시 세 가지 종류 : TextButton(), ElevatedButton(), IconButton()