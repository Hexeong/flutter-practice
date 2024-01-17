import 'package:flutter/material.dart';

class Homework1 extends StatelessWidget {
  const Homework1 ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:
      Scaffold(
        appBar: AppBar(
          title: Text('앱 제목'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,), // 상단 part
        body: Text('안녕'), // 중단 part, 필수 parameter
        bottomNavigationBar: BottomAppBar(
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.phone),
              Icon(Icons.message),
              Icon(Icons.contact_page)
            ],
          )), // 하단 part
      )
    );
  }
}


// AppBar() 사용 시 title은 제목, leading 제목 왼쪽 아이콘, actions는 제목 오른쪽 아이콘들 이런식으로 쓰면 예뻐짐
