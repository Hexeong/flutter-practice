import 'package:flutter/material.dart';
import 'package:mindcare/func/graph.dart';

class AnalyzePage extends StatefulWidget {
  const AnalyzePage({super.key});

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
        scrollOpacity =  0;
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
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 100,
          backgroundColor: Color(0xffffd1dc),
          flexibleSpace: Container(
            child: FlexibleSpaceBar(
              title: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '나의 감정분석 차트', 
                  style: TextStyle(
                    fontSize: 25, 
                    fontFamily: 'SoyoMaple',
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                      ),
                    ),
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
                Text(
                  '감정 분석 차트',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'SoyoMaple',
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 10,),
                DrawGraph(),
                SizedBox(height: 10,),
                Text(
                  '(사용자 이름)은 (최다 감정)을 제일 많이 느끼는구나....!',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'SoyoMaple',
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
                  TextButton(onPressed: (){
                    _showCustomDialog(context);
                  }, 
                  child: Text(
                    '눌러봐 이 바보야', 
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber.shade900
                    ),)
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}