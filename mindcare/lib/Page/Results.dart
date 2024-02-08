import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mindcare/store/EmotionStore.dart';
import 'package:provider/provider.dart';
import 'package:mindcare/store/ResultStore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  var star = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // 이 부분에서 비동기 함수를 호출합니다.
      context.read<ResultStore>().changeTab(); // 이 부분은 동기적이므로 그대로 유지합니다.
      await saveEmotion(); // 비동기 작업을 호출
      context.read<EmotionStore>().clearPushed(); // 동기적 작업
    });
  }

  Future<void> saveEmotion() async {
    var storage = await SharedPreferences.getInstance();
    var pushedEmotions = context.read<EmotionStore>().pushed;
    for (var emotion in pushedEmotions) {
      context.read<EmotionStore>().addEmotion(emotion);
    }
    await storage.setString(
        'emotionCount', jsonEncode(context.read<EmotionStore>().json));
    print('emotion saved');
    print(context.read<EmotionStore>().json);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/letter_background.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Colors.black,
                  //   width: 5,
                  // ),
                  // borderRadius: BorderRadius.all(Radius.circular(30)),
                  // color: Colors.white
                  color: Colors.transparent),
              height: size.height / 100 * 65,
              width: size.width / 100 * 75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 9,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(7),
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                                child: Text(
                              context.read<ResultStore>().AllLetter[
                                  context.read<ResultStore>().date]["letter"],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, setState) {
                                      return AlertDialog(
                                        title: Text(
                                          "평점을 매겨 주세요!",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  star = 1;
                                                });
                                              },
                                              icon: Icon(Icons.star_rounded,
                                                  color: (star >= 1
                                                      ? Colors.yellow
                                                      : Colors.black)),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  star = 2;
                                                });
                                              },
                                              icon: Icon(Icons.star_rounded,
                                                  color: (star >= 2
                                                      ? Colors.yellow
                                                      : Colors.black)),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  star = 3;
                                                });
                                              },
                                              icon: Icon(Icons.star_rounded,
                                                  color: (star >= 3
                                                      ? Colors.yellow
                                                      : Colors.black)),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  star = 4;
                                                });
                                              },
                                              icon: Icon(Icons.star_rounded,
                                                  color: (star >= 4
                                                      ? Colors.yellow
                                                      : Colors.black)),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  star = 5;
                                                });
                                              },
                                              icon: Icon(Icons.star_rounded,
                                                  color: (star >= 5
                                                      ? Colors.yellow
                                                      : Colors.black)),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                context
                                                    .read<ResultStore>()
                                                    .addStarPoint(star);
                                                Navigator.popUntil(
                                                    context,
                                                    ModalRoute.withName(
                                                        "/home"));
                                                print('팝언틸');
                                              },
                                              child: Text("확인"))
                                        ],
                                      );
                                    });
                                  });
                            },
                            child: Text("확인")),
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
