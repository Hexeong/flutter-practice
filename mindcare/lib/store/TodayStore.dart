import 'package:flutter/cupertino.dart';

class TodayStore extends ChangeNotifier{
  var typing = "";
  setTyping (t) {
    typing = t;
    notifyListeners();
  }
}