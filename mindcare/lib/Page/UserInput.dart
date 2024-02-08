import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mindcare/widget/birthdate_picker.dart';
import 'package:mindcare/Style/SoyoMaple.dart';

class UserInput extends StatefulWidget {
  final String userName;
  final String userJob;
  final DateTime userBirth;

  const UserInput({
    Key? key,
    required this.userName,
    required this.userJob,
    required this.userBirth,
  }) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  TextEditingController nameController = TextEditingController();
  late SharedPreferences storage;

  String nameInput = '';
  String userJob = '';
  DateTime userBirth = DateTime.now();
  String preview = '';
  String newBirth = '';
  String userJob1 = '';
  DateTime userBirth1 = DateTime.now();
  String preview1 = '';
  String newBirth1 = '';
  bool editName = true;
  bool editJob = false;
  bool editBirth = false;

  List<String> jobs = [
    '학생',
    '취업준비생',
    '프리랜서',
    '직장인',
    '사업가',
    '전업주부',
    '교사',
    '유학생',
    '공무원',
    '크리에이터',
    '운동선수',
    '더보기'
  ];
  List<String> moreJobs = [
    '예술가',
    '경찰',
    '소방관',
    '군인',
    '법조인',
    '의료계 종사자',
    '연예인',
    '언론인',
    '일용직',
    '기타'
  ];

  void showMoreJobs() {
    setState(() {
      jobs.addAll(moreJobs);
      jobs.remove('더보기');
      moreJobs.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    initStorage();
  }

  void onDateTimeChanged(dateTime) {
    setState(() {
      userBirth = dateTime;
    });
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '내 정보 입력 / 수정',
          style: soyoMaple700_25_black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '별명',
                      style: TextStyle(
                        fontFamily: 'Soyo',
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 40,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: nameController,
                            readOnly: editName,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(
                                  "[a-zA-Z0-9 \u3131-\u314e\u314f-\u3163\uac00-\ud7a3]+"))
                            ],
                            decoration: InputDecoration(
                              hintText: widget.userName.isEmpty
                                  ? '별명을 입력해주세요'
                                  : '${preview}',
                              hintStyle: soyoMaple400_20_black,
                              labelStyle: soyoMaple400_20,
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                editName = false;
                              });
                            },
                            child: Text('수정'))
                      ],
                    ),
                  ),
                  Text('(불리고픈 별명으로 적어주세요!)', style: soyoMaple400_20_black),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          '직업',
                          style: soyoMaple700_25_black,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          width: 230,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                editJob = true;
                              });
                            },
                            child: Text('수정'))
                      ],
                    ),
                  ),
                  Container(
                    height: 210,
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverGrid(
                            delegate: SliverChildListDelegate(
                              jobs
                                  .map((job) => Container(
                                        width: 10,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: userJob ==
                                                    job // 여기서 매칭되는지 확인
                                                ? Colors.blue.shade100
                                                : Colors.white, // 매칭이 맞다면 색상 변경
                                            border: Border.all(width: 1.0),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: TextButton(
                                          child: Text(job,
                                              style: TextStyle(
                                                  fontFamily: 'Soyo',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: Colors.black)),
                                          onPressed: () {
                                            if (editJob == true) {
                                              if (job == '더보기') {
                                                showMoreJobs();
                                              } else {
                                                setState(() {
                                                  userJob =
                                                      job; // 사용자가 선택한 직업 업데이트
                                                  print('$userJob');
                                                });
                                              }
                                            }
                                          },
                                        ),
                                      ))
                                  .toList(),
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 5, // 수평 패딩
                                    crossAxisSpacing: 5, //수직 패딩
                                    childAspectRatio: 2.5)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '생년월일',
                              style: soyoMaple700_25_black,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              width: 200,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    editBirth = true;
                                  });
                                },
                                child: Text('수정'))
                          ],
                        ),
                        Center(
                          child: TextButton(
                              child: Text(
                                '${userBirth.year}.${userBirth.month}.${userBirth.day}',
                                style: TextStyle(fontSize: 48),
                              ),
                              onPressed: () {
                                if (editBirth == true) {
                                  showCupertinoDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext context) {
                                        return Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                              color: Colors.white,
                                              height: 300,
                                              child: BirthDatePicker(
                                                initDateStr:
                                                    userBirth.toString(),
                                                onDateTimeChanged:
                                                    onDateTimeChanged,
                                              )),
                                        );
                                      });
                                }
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: TextButton(
          onPressed: () {
            saveData();
            print(
                '저장완료 - userName: ${nameController.text}, userJob: $userJob, userBirth: ${userBirth.year.toString()}-${userBirth.month.toString()}-${userBirth.weekday.toString()}');
            Navigator.pop(context, 'tutostart');
          },
          child: Text('저장'),
        ),
      ),
    );
  }

  initStorage() async {
    storage = await SharedPreferences.getInstance();
    print('initStorage complete-userinput');
    loadSavedData();
    print('savedData-loaded');
  }

  saveData() async {
    storage.setString('userName', nameController.text);
    storage.setString('userJob', userJob);
    storage.setString('userBirth',
        '${userBirth.year.toString()}-${userBirth.month.toString()}-${userBirth.day.toString()}');
    loadSavedData();
  }

  loadSavedData() async {
    preview1 = await storage.getString('userName') ?? '';
    userJob1 = await storage.getString('userJob') ?? '';
    newBirth1 = await storage.getString('userBirth') ?? '';
    DateFormat format = DateFormat('yyyy-MM-dd');
    userBirth1 = format.parse(newBirth1);
    setState(() {
      preview = preview1;
      userJob = userJob1;
      userBirth = userBirth1;
    });
    print('loadSavedData complete');
  }
}
