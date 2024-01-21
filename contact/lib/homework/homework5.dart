import 'package:flutter/material.dart';

class Homework5 extends StatefulWidget {
  const Homework5({super.key});

  @override
  State<Homework5> createState() => _Homework5State();
}

class _Homework5State extends State<Homework5> {
  var inputString = '';
  var titleString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: Builder(
      //   builder: (jokbo1) {
      //     return FloatingActionButton(
      //         child: Text('Button'),
      //         onPressed: () {
      //           showDialog(context: jokbo1, builder: (context){
      //             return Dialog(child: Text('AlertDialog Title'),);
      //           });
      //         }
      //     );
      //   },
      // ),
      // showDialog와 context 조상 관련 에러 해결법2, 새로운 context 생성

      floatingActionButton: FloatingActionButton(
        child: Text('버튼'),
        onPressed: (){
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return AlertDialog(
                  title: Text('제목'),
                  content: TextField(
                    onChanged: (text) {
                      setState(() {
                        inputString = text;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Input'
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            titleString = inputString;
                          });
                        },
                        child: Text('완료')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Navigator.pop(context); 해도 됨
                        },
                        child: Text('취소'))
                  ],
                );
              });
        },
      ),
      // showDialog와 context 조상 관련 에러 해결법. context가 MaterialApp을 갖게 커스텀 위젯 생성
      body: Text('텍스트 결과 : $titleString'),
    );
  }
}
