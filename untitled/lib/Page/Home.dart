import 'package:flutter/material.dart';

import '../widget/EmotionModal.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/background_img.png")
            )
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("지금 느끼는 감정을 자세히 말해줄래?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return Container(
                              height: 600, // 모달 높이 크기
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white, // 모달 배경색
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10), // 모달 좌상단 라운딩 처리
                                  topRight: Radius.circular(10), // 모달 우상단 라운딩 처리
                                ),
                              ),
                              child: EmotionModal(), // 모달 내부 디자인 영역
                            );
                          },
                        );
                      },
                      child: Text("감정", style: TextStyle(fontSize: 20),)
                  )
                ],
              ),
            )
        )
    );
  }
}
