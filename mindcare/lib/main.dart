import 'dart:ui';
import 'package:flutter/material.dart';
import 'Page/HomePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // 추가적인 localizationsDelegates 추가 가능
      ],
      supportedLocales: [
        const Locale('en', 'US'), // 영어
        const Locale('ko', 'KR'), // 한국어
        // 추가적인 supportedLocales 추가 가능
      ],
      home: MyHomePage(),
    )
  );
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(

//       ),
//       bottomNavigationBar: Container(
//         child: Row(
//           children: [
//             IconButton(onPressed: (){

//             },
//             icon: Icon(Icons.analytics_outlined, size: 40),
            
//             ), 
//             IconButton(
//             key: ,  
//             onPressed: (){

//             },
//             icon: Icon(Icons.add_circle_outline, size: 80,),
//             ), 
//             IconButton(onPressed: (){

//             },
//             icon: Icon(Icons.person, size: 40,),
//             ), 
//           ],
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         )
//       ),
//     );
//   }
// }
