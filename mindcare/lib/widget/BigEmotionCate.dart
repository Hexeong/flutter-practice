import 'package:flutter/material.dart';
import 'package:mindcare/widget/SmallEmotionCate.dart';

class BigEmotionCate extends StatefulWidget {
  const BigEmotionCate({super.key});

  @override
  State<BigEmotionCate> createState() => _BigEmotionCateState();
}

class _BigEmotionCateState extends State<BigEmotionCate> {
  var choice;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600, // 모달 높이 크기
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.transparent, // 모달 배경색
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), // 모달 좌상단 라운딩 처리
            topRight: Radius.circular(10), // 모달 우상단 라운딩 처리`
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                "지금 느끼는 기분을 자세히 알려줄래?",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              Text(
                "(카테고리를 선택하면 더 자세한 감정을 고를 수 있어!)",
                style: TextStyle(fontSize: 15),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          choice = "red";
                        });
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SmallEmotionCate(
                                      choice: choice,
                                    ),
                                settings:
                                    RouteSettings(name: "/SmallEmotionCate")));
                      },
                      child: Text("긴장되거나\n가슴이 두근 거리는\n느낌"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF1766E)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          choice = "yellow";
                        });
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SmallEmotionCate(
                                      choice: choice,
                                    ),
                                settings:
                                    RouteSettings(name: "/SmallEmotionCate")));
                      },
                      child: Text("힘이나고\n기분 좋은 느낌"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xEEECCF5A)),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          choice = "blue";
                        });
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SmallEmotionCate(
                                      choice: choice,
                                    ),
                                settings:
                                    RouteSettings(name: "/SmallEmotionCate")));
                      },
                      child: Text("기운이 빠지고\n걱정되는 느낌"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff4c68dc)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          choice = "green";
                        });
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SmallEmotionCate(
                                      choice: choice,
                                    ),
                                settings:
                                    RouteSettings(name: "/SmallEmotionCate")));
                      },
                      child: Text("편안하고\n온화한 느낌"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff519a3b)),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
