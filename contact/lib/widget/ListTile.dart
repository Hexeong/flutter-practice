import 'package:flutter/material.dart';

class LTile extends StatelessWidget {
  const LTile({
    Key? key,
    required this.name, // 값을 받기 위한 선언
  }) : super(key: key);

  final String name; // 값의 초기화

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: Image.asset('profile.png', width: 40, height: 40,),
      ),
      title: Text(name), // 참조 값 사용
    );
    // return Container(
    //   padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
    //   child: ListTile(
    //     leading: Image.asset('profile.png'),
    //     title: Text("홍길동"),
    //   ),
    // );
  }
}
