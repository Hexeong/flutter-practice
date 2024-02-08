import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mindcare/Style/SoyoMaple.dart';
import 'package:mindcare/Page/HomePage.dart'; // MyHomePage 파일의 위치에 따라 경로를 수정해야 할 수도 있습니다.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 기본 스플래시를 사용하지 않고자 할 때 home 대신 routes로 지정
      // home: SplashScreen(),
      routes: {
        '/': (context) =>
            SplashScreen(), // SplashScreen이 사용자 정의 스플래시 화면을 나타내는 위젯입니다.
        '/home': (context) => MyHomePage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 2초 후에 MyHomePage로 이동
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacementNamed('/home'), // '/home'으로 이동
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/image/splash/splash_after.jpg', // 스플래시 이미지 파일의 경로
          // 이미지가 화면에 가운데 정렬되도록 설정
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
