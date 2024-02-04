import 'package:flutter/material.dart';
import 'package:mindcare/Page/UserInfo.dart';
import 'package:mindcare/Style/SoyoMaple.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '내 정보',
          style: TextStyle(
            fontFamily: 'Soyo',
            fontWeight: FontWeight.w700,
            color: Colors.black
          ),
        )
      ),
      body: Row(
        children: [
          ListTile(
            title: Text(
              '내 정보 보기 / My Info', 
              style: soyoMaple700_25
              ),
            leading: Icon(Icons.person, size: 25),
            onTap: () => UserInfo(),
          ),

        ],
      ),
    );
  }
}