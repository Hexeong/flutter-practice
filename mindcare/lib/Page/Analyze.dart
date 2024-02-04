import 'package:flutter/material.dart';
import 'package:mindcare/func/graph.dart';
import 'package:mindcare/Style/SoyoMaple.dart';

// 예제
class AnalyzePage extends StatefulWidget {
  final String userName;

  AnalyzePage({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  State<AnalyzePage> createState() => _AnalyzePageState();
}

class _AnalyzePageState extends State<AnalyzePage> {
  final _scrollController = ScrollController();
  double scrollOpacity = 0;

  onScroll() {
    setState(() {
      double offset = _scrollController.offset;
      if (offset < 36) {
        scrollOpacity = 0;
      } else if (offset > 36) {
        scrollOpacity = 1;
      }
    });
  }

  @override
  void initState() {
    _scrollController.addListener(onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(onScroll);
    super.dispose();
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('하위 멍청이'),
          content: Text('가서 개발이나해 이런거 보지 말고'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('닫기'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(children: [
        CustomScrollView(
          physics: BouncingScrollPhysics(),
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 100,
              backgroundColor: Colors.white,
              flexibleSpace: Container(
                color: Colors.white,
                child: FlexibleSpaceBar(
                  title: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text('감정분석 차트', style: soyoMaple700_25_black),
                  ),
                  centerTitle: true,
                  titlePadding: EdgeInsetsDirectional.only(
                    start: 16,
                    bottom: 25,
                  ),
                ),
              ),
              bottom: PreferredSize(
                child: Opacity(
                  opacity: scrollOpacity,
                  child: Container(
                    color: Colors.white,
                    height: 16,
                  ),
                ),
                preferredSize: Size.fromHeight(0),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 2안
                    // Text(
                    //   '감성분석차트',
                    //   style: TextStyle(
                    //       fontFamily: 'soyoMaple',
                    //       fontWeight: FontWeight.w700,
                    //       fontSize: 40,
                    //       color: Colors.black),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    DrawGraph(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${widget.userName}은(는) 속상한 감정을 \n제일 많이 느끼는구나....!',
                      style: soyoMaple400_25_black,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextButton(
                        onPressed: () {
                          _showCustomDialog(context);
                        },
                        child:
                            Text('이전 편지 다시보기', style: soyoMaple700_20_black)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
