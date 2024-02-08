import 'package:flutter/material.dart';
import 'package:mindcare/Style/SoyoMaple.dart';

class ViewPreviousLetter extends StatelessWidget {
  ViewPreviousLetter({Key? key}) : super(key: key);

  List letters = [
    '안녕 반가워. 이 편지는 처음이야 처음 편지라서 뭘 써야할지 막막하다안녕 반가워. ',
    '두번째 편지야. 두번째 편지를 쓰는데 재밌다',
    '세번째 편지야. 여러분을 만나서 행복해요'
  ];
  List days = ['2024-01-31', '2024-02-03', '2024-02-05'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('이전 편지 보기'),
      ),
      body: ListView.builder(
        itemCount: letters.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.text_snippet_rounded),
            title: Text(days[index]),
            onTap: () {
              _showLetterDialog(context, letters[index]);
            },
          );
        },
      ),
    );
  }

  void _showLetterDialog(BuildContext context, String letter) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('편지 내용'),
          content: SingleChildScrollView(
            child: Text(letter),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('닫기'),
            ),
          ],
        );
      },
    );
  }
}
