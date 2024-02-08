import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:mindcare/Style/SoyoMaple.dart';

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
              child: SingleChildScrollView(
                child: Text(
                    '안녕하세요, (팀 이름)입니다!\n정신과나 심리상담을 받으러 망설인 적 있지 않으신가요?\n편하게 털어놓지 못 해 마음이 아파도 혼자 끙끙 앓고, 마음을 돌보는 건 더욱 어색하기만 해요.\n그러한 어려움을 누구보다도 잘 알기에, 더 쉽게 내 마음을 내가 보듬어 줄 수 있다면 좋겠다고 생각해 (앱이름)을 개발하게 되었어요.\n그날 겪은 사건과 감정을 떠올리고, 감정에 이름표를 달아보고, 그 감정을 글로 써내려가다 보면\n어느 순간에 긍정적 혹은 부정적으로 바뀌었는지, 그리고 왜 그런 생각이 들었는지도 알 수 있어요.\n내 안에 있는 다양한 감정을 마주하면서 소모적인 감정은 조금씩 흘려 보내고\n나에게 힘이 되는 감정은 더 감사한 마음으로 받아들이는 연습을 할 수 있게 된답니다!\n나의 서툰 부분까지도 용기 내어 끌어안을 수 있도록, (캐릭터 이름)이 도와줄 거예요!\n여러분의 피드백을 통해 더 발전한 모습으로 24년 11월, 정식 앱을 출시할 예정이에요.\n어떤 내용이라도 좋으니 마음껏 여러분의 생각을 적어 보내주세요!\n꼼꼼히 읽고 반영할 수 있도록 하겠습니다!\n앞으로도 (앱이름) 많은 관심 부탁드려요, 감사합니다!'),
              ),
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
