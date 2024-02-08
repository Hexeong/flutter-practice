import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultStore extends ChangeNotifier {
  var AllLetter = {}; // result -> date -> letter, star
  var t = 0;
  var date;

  addLetter(letter) async {
    date = DateTime.now().toString();
    AllLetter[date] = {
      "letter" : letter
    };
    t = 1;
    var pref = await SharedPreferences.getInstance();
    await pref.setString("AllLetter", jsonEncode(AllLetter));

    notifyListeners();
  }

  addStarPoint(star) async {
    var data;
    var pref = await SharedPreferences.getInstance();
    data = await pref.getString("AllLetter");
    data = jsonDecode(data);
    print(data);
    data[date]["star"] = star;

    await pref.setString("AllLetter", jsonEncode(data));

    print("별점 잘 저장됨");
    notifyListeners();
  }
}