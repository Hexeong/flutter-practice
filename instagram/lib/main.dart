import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
// http 대신 dio 패키지가 좋을 수 있음, 코드 짧아지고 편의성 기능도 많음
import 'dart:convert';

import './widget/Home.dart';
import './widget/Shop.dart';
import './style/mainStyle.dart' as style;

void main() {
  runApp(
    MaterialApp(
      theme: style.theme,
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  int tab = 0;

  var list;

  getData() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    if(result.statusCode == 200) {
      setState(() {
        list = jsonDecode(result.body);
      });
    } else {
      Fluttertoast.showToast(
          msg: "정보를 받아오는 데 실패했습니다. 재접속부탁드립니다.",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          fontSize: 20,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget bodyWidget (t) {
    if(t == 0) return Home(list: list);
    else return Shop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram"),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 9, 0),
            child: Transform.scale(
              scale: 1.5,
              child: Icon(Icons.add_box_outlined),
            ),
          )
        ],
      ),
      body: bodyWidget(tab),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tab,
        onTap: (i) {
         print(i);
         setState(() {
           tab = i;
         });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Shop',
              activeIcon: Icon(Icons.shopping_bag)
          )
        ],
        selectedItemColor: Colors.black,
      )
    );
  }
}