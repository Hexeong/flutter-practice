import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  FAB({Key? key}) : super(key: key);

  var a = 1;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Text(a.toString()), // 버튼을 눌렀을 때 재 렌더링이 되지 않기에 버튼 Text는 변하지 않는다
      onPressed: (){a++;},
    );
  }
}
