import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mindcare/Style/SoyoMaple.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
