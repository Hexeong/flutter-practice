import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mindcare/Page/Results.dart';
import 'package:mindcare/store/CauseStore.dart';
import 'package:mindcare/store/EmotionStore.dart';
import 'package:mindcare/store/ResultStore.dart';
import 'package:mindcare/store/TodayStore.dart';
import 'package:mindcare/widget/Done.dart';
import 'package:mindcare/widget/Waiting.dart';
import '../OpenAI/ConfigOpenAI.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var tab = [Waiting(), Done()];

  var background = [
    "assets/image/write_letter_ing.jpg",
    "assets/image/write_letter_done.jpg"
  ];

  @override
  void initState() {
    super.initState();
    writeLetter(
        context.read<EmotionStore>().pushed.join(', '), // 감정
        context.read<CauseStore>().typing, // 원인
        context.read<TodayStore>().typing, // 오늘 있던 일
        context.read<ResultStore>().addLetter); // 비동기 callback 형식
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(background[context.watch<ResultStore>().t]),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            width: double.infinity, child: tab[context.watch<ResultStore>().t]),
      ),
    );
  }
}
