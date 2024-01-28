import 'package:flutter/material.dart';

class CauseStore extends ChangeNotifier {
  var typing = "";
  var cause = [
    "가족",
    "연애",
    "이별",
    "돈",
    "자존감",
    "인간관계",
    "공부",
    "운동",
    "불면",
    "직장",
    "일",
    "건강",
    "취미",
    "생활",
    "이유없음",
  ];
  changeType(c) {
    typing = c;
    notifyListeners();
  }
}