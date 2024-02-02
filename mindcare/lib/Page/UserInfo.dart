import 'package:flutter/material.dart';

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
    );
  }
}