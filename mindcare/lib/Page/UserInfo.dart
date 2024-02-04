import 'package:flutter/material.dart';
import 'package:mindcare/Page/UserInfo.dart';
import 'package:mindcare/Page/UserInput.dart';
import 'package:mindcare/Style/SoyoMaple.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  TextEditingController feedbackController = TextEditingController();
  String feedBackString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('내 정보', style: soyoMaple700_25_black)),
      body: Column(
        children: [
          ListTile(
              title: Text('내 정보 보기 / My Info', style: soyoMaple700_25_black),
              leading: Icon(Icons.person, size: 25),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserInput()))),
          ListTile(
            title: Text(
              '피드백 전송',
              style: soyoMaple700_25_black,
            ),
            leading: Icon(
              Icons.edit_document,
              size: 25,
            ),
            onTap: () => showFeedBack(context),
          )
        ],
      ),
    );
  }

  void showFeedBack(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: feedbackController,
              maxLength: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: '당신의 의견을 적어주세요!',
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    feedBackString = feedbackController.text;
                    // firebase 연동하기
                    Navigator.of(context).pop(); // 다이얼로그 닫기
                  },
                  child: Text(
                    '전송하기',
                    style: soyoMaple700_25_black,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // 다이얼로그 닫기
                  },
                  child: Text(
                    '닫기',
                    style: soyoMaple700_25_black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
