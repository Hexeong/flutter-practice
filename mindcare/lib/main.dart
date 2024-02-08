import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:mindcare/Style/SoyoMaple.dart';
import 'package:mindcare/Page/HomePage.dart';
import 'package:mindcare/Style/mainStyle.dart' as theme;
import 'store/EmotionStore.dart' as emotion_store;
import 'store/CauseStore.dart' as cause_store;
import 'store/TodayStore.dart' as today_store;
import 'package:mindcare/store/ResultStore.dart' as result_store;

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (c) => emotion_store.EmotionStore()),
      ChangeNotifierProvider(create: (c) => cause_store.CauseStore()),
      ChangeNotifierProvider(create: (c) => today_store.TodayStore()),
      ChangeNotifierProvider(create: (c) => result_store.ResultStore()),
    ],
    child: MaterialApp(
      theme: theme.theme,
      initialRoute: "/",
      routes: {
        '/': (context) =>
            SplashScreen(), // SplashScreen이 사용자 정의 스플래시 화면을 나타내는 위젯입니다.
        '/home': (context) => MyHomePage(),
      },
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      // 기본 스플래시를 사용하지 않고자 할 때 home 대신 routes로 지정
      // home: SplashScreen(),
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
      () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(),
              settings: RouteSettings(name: "/home"))), // '/home'으로 이동
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
