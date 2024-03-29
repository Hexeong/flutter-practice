import 'package:flutter/material.dart';

class EmotionStore extends ChangeNotifier {
  List<bool> pushed_emotion = List<bool>.filled(79, false, growable: true);
  var pushed = [];
  // 최대 3개까지 설정하게

  Map<String, int> json = {};

  var red = [
    "격분한",
    "공황에 빠진",
    "스트레스",
    "초조한",
    "충격받은",
    "격노한",
    "몹시 화난",
    "좌절한",
    "신경질적인",
    "망연자실한",
    "화가 차오르는"
        "겁먹은",
    "화가난",
    "",
    "안절부절 못하는",
    "불안한",
    "우려하는",
    "근심하는",
    "짜증나는",
    "거슬리는",
    "불쾌한",
    "골치아픈",
    "걱정하는",
    "마음이 불편한"
        "언짢은"
  ];

  var yellow = [
    "놀란",
    "긍정적인",
    "즐거운",
    "매우 신나는",
    "황홀한",
    "들뜬",
    "쾌활한",
    "동기부여된",
    "영감을 받은",
    "의기양양한",
    "기운 넘치는",
    "활발한",
    "흥분한",
    "낙관적인",
    "열광하는",
    "만족하는",
    "집중하는",
    "행복한",
    "자랑스러운",
    "짜릿한",
    "유쾌한",
    "기쁜",
    "희망적인",
    "재미있는",
    "더없이행복한"
  ];

  var kind_of_emotion = [
    "신나는",
    "열정적인",
    "희망찬",
    "반가운",
    "짜릿한",
    "당황스러운",
    "충격받은",
    "질투나는",
    "불쾌한",
    "짜증나는",
    "괴로운",
    "원망스러운",
    "억울한",
    "분한",
    "황홀한",
    "설레는",
    "화나는",
    "뿌듯한",
    "기쁜",
    "기대되는",
    "자신있는",
    "재미있는",
    "부러운",
    "심란한",
    "초조한",
    "속상한",
    "미운",
    "경멸스러운",
    "불안한",
    "두려운",
    "수치스러운",
    "감동한",
    "대견한",
    "즐거운",
    "영감을받은",
    "의욕적인",
    "후련한",
    "궁금한",
    "고민되는",
    "걱정되는",
    "아쉬운",
    "답답한",
    "난처한",
    "언짢은",
    "실망한",
    "상처받은",
    "슬픈",
    "비참한",
    "행복한",
    "사랑하는",
    "만족스러운",
    "든든한",
    "존중받는",
    "어이없는",
    "그저그런",
    "부담스러운",
    "시무룩한",
    "그리운",
    "미안한",
    "부끄러운",
    "서운한",
    "후회되는",
    "죄책감",
    "감사한",
    "평온한",
    "여유로운",
    "편안한",
    "나른한",
    "안심되는",
    "무감한",
    "귀찮은",
    "지루한",
    "피곤한",
    "무기력한",
    "공허한",
    "외로운",
    "우울한",
    "지친",
    "절망적인",
  ];

  changeState(i) {
    if (!pushed_emotion[i] && pushed.length == 3) {
      print("3개 이상 선택할 수 없습니다.");
    } else {
      if (pushed_emotion[i]) {
        // 풀었을때
        pushed_emotion[i] = !pushed_emotion[i];
        pushed.remove(kind_of_emotion[i]);
      } else {
        // 눌렀을때
        pushed_emotion[i] = !pushed_emotion[i];
        pushed.add(kind_of_emotion[i]);
      }
      notifyListeners();
    }
  }

  clearPushed() {
    pushed.clear();
    pushed_emotion = List<bool>.filled(79, false, growable: true);
    notifyListeners();
  }

  addEmotion(emotion) {
    if (json.containsKey(emotion)) {
      json[emotion] = (json[emotion] ?? 0) + 1;
      print('plus emotion');
    } else {
      json[emotion] = 1;
      print('add new emotion');
    }
    notifyListeners();
  }
}
