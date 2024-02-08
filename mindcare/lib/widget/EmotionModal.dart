import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mindcare/Page/Cause.dart';
import 'package:mindcare/store/EmotionStore.dart';

class EmotionModal extends StatelessWidget {
  const EmotionModal({super.key});

  pushedStyle(p) {
    if (p) {
      return TextButton.styleFrom(
          backgroundColor: Colors.black, foregroundColor: Colors.white);
    } else {
      return TextButton.styleFrom(
          backgroundColor: Colors.white, foregroundColor: Colors.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 7;
    final double itemWidth = size.width / 2;

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
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 16),
                child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text("지금 느끼는 감정을 자세히 말해줄래?",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w700)),
                        Text(
                          "(최대 3개까지 선택 가능)",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    )),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(5),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (c, i) => TextButton(
                    child: Text(
                      context.read<EmotionStore>().kind_of_emotion[i],
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      context.read<EmotionStore>().changeState(i);
                    },
                    style: pushedStyle(
                        context.watch<EmotionStore>().pushed_emotion[i]),
                  ),
                  childCount:
                      context.read<EmotionStore>().kind_of_emotion.length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: (itemWidth / itemHeight),
                  mainAxisSpacing: 5, //수평 Padding
                  crossAxisSpacing: 5, //수직 Padding
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Center(
                  child: OutlinedButton(
                    child: Text(
                      "확인",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
                    ),
                    style: OutlinedButton.styleFrom(
                        minimumSize: Size(130, 70),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Cause(),
                              settings: RouteSettings(name: "/Cause")));
                    },
                  ),
                ),
              ),
            )
          ],
        ) // 모달 내부 디자인 영역
        );
  }
}
