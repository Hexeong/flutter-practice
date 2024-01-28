import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Page/Home.dart';

import './theme/mainTheme.dart' as theme;
import './store/EmotionStore.dart' as emotion_store;
import './store/CauseStore.dart' as cause_store;
import './store/TodayStore.dart' as today_store;


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (c) => emotion_store.EmotionStore()),
      ChangeNotifierProvider(create: (c) => cause_store.CauseStore()),
      ChangeNotifierProvider(create: (c) => today_store.TodayStore())
    ],
    child: MaterialApp(
      theme: theme.theme,
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
