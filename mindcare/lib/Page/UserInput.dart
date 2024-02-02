import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mindcare/func/birthdate_picker.dart';


class UserInput extends StatefulWidget {
  UserInput({Key? key}) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  TextEditingController nameController = TextEditingController();
  late SharedPreferences storage;


  String nameInput = '';

  List<String> jobs = [
    '학생', '취업준비생', '프리랜서', '직장인', 
    '사업가', '전업주부', '교사', '유학생', 
    '공무원', '크리에이터', '운동선수', '더보기'
  ];
  List<String> moreJobs = [
    '예술가', '경찰', '소방관', '군인', 
    '법조인', '의료계 종사자', '연예인', '언론인', 
    '일용직', '기타'
  ];

  void showMoreJobs() {
    setState(() {
      jobs.addAll(moreJobs);
      moreJobs.clear();
    });
  }

  @override
  void initState() {
    initStorage();
  }

  String userJob = '';
  
  DateTime userBirth = DateTime.now();

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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '별명', 
                      style: TextStyle(
                        fontFamily: 'Soyo',
                        fontWeight: FontWeight.w700,
                        fontSize: 25
                        ),
                        textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 40,
                    child: TextField(
                      controller: nameController,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 \u3131-\u314e\u314f-\u3163\uac00-\ud7a3]+"))],
                      decoration: InputDecoration(
                        hintText: '별명을 여기 입력해주세요!',
                        labelStyle: TextStyle(fontFamily: 'Soyo', fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Text(
                    '(불리고픈 별명으로 적어주세요!)', 
                    style: TextStyle(
                      fontFamily: 'Soyo',
                      fontWeight: FontWeight.w400,
                      fontSize: 20
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '직업', 
                      style: TextStyle(
                        fontFamily: 'Soyo',
                        fontWeight: FontWeight.w700,
                        fontSize: 25
                        ),
                        textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 200,
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverGrid(
                          delegate: SliverChildListDelegate(
                            jobs.map((job) => Container(
                              width: 10,
                              height: 40,
                              decoration: BoxDecoration(border: Border.all(width: 1.0), borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: TextButton(
                                child: Text(job, style: TextStyle(fontFamily: 'Soyo', fontWeight: FontWeight.w400, fontSize: 15, color: Colors.black)),
                                onPressed: () {
                                  if (job == '더보기') {
                                    setState(() {
                                      if(moreJobs.isNotEmpty){
                                        jobs.removeLast();
                                        jobs.addAll(moreJobs);
                                        moreJobs.clear();
                                      }
                                    });
                                  }
                                  else{
                                    setState(() {
                                    userJob = job;
                                    print('$userJob');
                                  });
                                  }
                                },
                              ),
                            )
                            ).toList(),
                          ),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5, // 수평 패딩
                            crossAxisSpacing: 5, //수직 패딩
                            childAspectRatio: 2.5
                          )
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '생년월일', 
                          style: TextStyle(
                            fontFamily: 'Soyo',
                            fontWeight: FontWeight.w700,
                            fontSize: 25
                            ),
                            textAlign: TextAlign.left,
                        ),
                        Center(
                          child: TextButton(
                            child: Text('${userBirth.year}.${userBirth.month}.${userBirth.day}',
                              style: TextStyle(fontSize: 48),),
                            onPressed: () {
                              showCupertinoDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      color: Colors.white,
                                      height: 300,
                                      child: BirthDatePicker(initDateStr: userBirth.toString(), onDateTimeChanged: onDateTimeChanged,)
                                    ),
                                  );
                                }
                              );
                            }
                          ),
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
            print('저장완료 - userName: ${nameController.text}, userJob: $userJob, userBirth: ${userBirth.year.toString()}-${userBirth.month.toString()}-${userBirth.weekday.toString()}');
            Navigator.pop(context);
          },
          child: Text('확인'),
          ),
      )
    );
  }

  initStorage() async {
    storage = await SharedPreferences.getInstance();
    print('initStorage complete');
  }
  
  saveData() async {
    storage.setString('userName', nameController.text);
    storage.setString('userJob', userJob);
    storage.setString('userBirth', '${userBirth.year.toString()}-${userBirth.month.toString()}-${userBirth.day.toString()}');
  }
}