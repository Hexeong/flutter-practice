import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Page/Cause.dart';
import 'package:untitled/store/EmotionStore.dart';

class EmotionModal extends StatelessWidget {
  const EmotionModal({super.key});

  pushedStyle(p) {
    if(p) {
      return TextButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white
      );
    } else {
      return TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.purple
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 7;
    final double itemWidth = size.width / 2;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 16),
            child: Container(
              alignment: Alignment.center,
              child: Text("지금 느끼는 감정을 자세히 말해줄래?", style: TextStyle(
                fontSize: 30,
              )),
            ),
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
              (c, i) => TextButton(
                child: Text(context.read<EmotionStore>().kind_of_emotion[i], style: TextStyle(fontSize: 15),),
                onPressed: () {
                  context.read<EmotionStore>().changeState(i);
                },
                style: pushedStyle(context.watch<EmotionStore>().pushed_emotion[i]),
              ),
              childCount: context.read<EmotionStore>().kind_of_emotion.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: (itemWidth / itemHeight),
            mainAxisSpacing: 5, //수평 Padding
            crossAxisSpacing: 5, //수직 Padding
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Center(
              child: OutlinedButton(
                child: Text("확인"),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Cause()));
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
