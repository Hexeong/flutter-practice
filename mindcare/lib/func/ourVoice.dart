import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void showOurVoice(
    BuildContext context, SharedPreferences storage, bool wantVoice) {
  if (wantVoice == true) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 400,
              width: 400,
              child: Text('방가방가'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    storage.setBool('wantVoice', false);
                    print('더이상 안보기 저장완료');
                    Navigator.of(context).pop(); // 다이얼로그 닫기
                  },
                  child: Text('다시 보지 않기'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // 다이얼로그 닫기
                  },
                  child: Text('닫기'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  } else {
    return;
  }
}
