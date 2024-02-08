import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mindcare/Page/Home.dart';

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
      home: MyApp(),
      initialRoute: "/",
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // font-family : '눈누' - 소요단풍체 -> Bold, regular

  // flutter-gif
  // https://pub.dev/packages/flutter_gif
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}


// firebase cli info
// Platform  Firebase App Id
// web       1:785624414692:web:3c5b5d3b7013e17d2c2ff1
// android   1:785624414692:android:4b23db1e532dffce2c2ff1
// ios       1:785624414692:ios:c87eef579ddf46ce2c2ff1
// macos     1:785624414692:ios:7c9c50256d546d4f2c2ff