import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// http 대신 dio 패키지가 좋을 수 있음, 코드 짧아지고 편의성 기능도 많음
import 'dart:convert';

import './config/notification.dart';

import './widget/Home.dart';
import './widget/Upload.dart';
import './widget/Shop.dart';
import './style/mainStyle.dart' as style;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => Store1()),
        ChangeNotifierProvider(create: (c) => Store2())
      ],
      child: MaterialApp(
        theme: style.theme,
        home: MyApp(),
      ),
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
  int getReq = 0;

  var list = [];
  var userImage;

  getData() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    if(result.statusCode == 200) {
      setState(() {
        getReq++;
        list = jsonDecode(result.body);
        for(var i = 0; i<list.length; i++) {
          list[i]["image"] = Image.network(list[i]["image"], height: 300, width: double.infinity,);
        }
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

  moreDatabyScroll() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/more${getReq.toString()}.json'));
    if(result.statusCode == 200) {
      setState(() {
        getReq++;
        var more = jsonDecode(result.body);
        more["image"] = Image.network(more["image"], height: 300, width: double.infinity,);
        list.add(more);
      });
    } else {
      print("http get req error");
    }
  }

  addData(imgFile, writer, content) {
    var nowTime = DateTime.now();
    setState(() {
      list.add({
        "id" : list.length,
        "image" : Image.file(imgFile, height: 300, width: double.infinity,),
        "likes" : 0,
        "date" : "${nowTime.month}, ${nowTime.day}",
        "content" : content,
        "liked" : false,
        "user" : writer
      });
    });
  }

  saveData() async {
    var storage = await SharedPreferences.getInstance();
    storage.setString('name', 'john');
    var result = storage.getString('name');
    print(result);
  }

  moveHome() {
    setState(() {
      tab = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    initNotification();
    getData();
  }

  bodyWidget(t) {
    if(t == 0) {
      return Home(list: list, moreData: moreDatabyScroll);
    }
    else if (t == 1) {
      return Upload(addData: addData, moveHome: moveHome);
    }
    else {
      return Shop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Text("+"),
        onPressed: () {
          showNotification();
        },
      ),
      appBar: AppBar(
        title: Text("Instagram"),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 9, 0),
            child: Transform.scale(
              scale: 1.5,
              child: IconButton(
                icon: Icon(Icons.add_box_outlined),
                onPressed: () {
                  saveData();
                },
              ),
            ),
          )
        ],
      ),
      body: bodyWidget(tab),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tab,
        onTap: (i) {
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
              icon: Icon(Icons.send_outlined),
              label: 'Post',
              activeIcon: Icon(Icons.send)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Shop',
              activeIcon: Icon(Icons.shopping_bag)
          )
        ],
        selectedItemColor: Colors.black,
      ),
    );
  }
}

class Store1 extends ChangeNotifier {
  var name = 'john kim';
}

class Store2 extends ChangeNotifier {
  var follower = 100;
  var friend = false;
  var profileImage = [];

  getData() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/profile.json'));
    var result2 = jsonDecode(result.body);
    profileImage = result2;
    notifyListeners();
  }
  Follow() {
    if(friend) {
      follower = follower - 1;
      friend = !friend;
      notifyListeners();
    } else {
      follower = follower + 1;
      friend = !friend;
      notifyListeners();
    }
  }
}