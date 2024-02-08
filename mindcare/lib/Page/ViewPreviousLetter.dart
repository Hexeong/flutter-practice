import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mindcare/Style/SoyoMaple.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class ViewPreviousLetter extends StatefulWidget {
  ViewPreviousLetter({Key? key}) : super(key: key);

  @override
  State<ViewPreviousLetter> createState() => _ViewPreviousLetterState();
}

class _ViewPreviousLetterState extends State<ViewPreviousLetter> {
  List letters = [];

  List days = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getLetter();
    });
  }

  Future<void> getLetter() async {
    var pref = await SharedPreferences.getInstance();
    var string = await pref.getString("AllLetter") ?? '';
    var data = jsonDecode(string);
    DateFormat format = DateFormat('yyyy-MM-dd');
    data.keys.forEach((key) {
      var date = format.parse(key);
      setState(() {
        letters.add(data[key]["letter"]);
        days.add(date);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('이전 편지 보기'),
      ),
      body: ListView.builder(
        itemCount: letters.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.text_snippet_rounded),
            title: Text(
              '${days[index].year}-${days[index].month}-${days[index].day}',
              style: soyoMaple700_25_black,
            ),
            onTap: () {
              _showLetterDialog(context, letters[index]);
            },
          );
        },
      ),
    );
  }

  void _showLetterDialog(BuildContext context, String letter) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('편지 내용'),
          content: SingleChildScrollView(
            child: Text(letter),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('닫기'),
            ),
          ],
        );
      },
    );
  }
}
