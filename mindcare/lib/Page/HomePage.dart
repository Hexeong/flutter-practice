import 'dart:ui';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mindcare/widget/star.dart';
import 'package:mindcare/widget/ourVoice.dart';
import 'package:mindcare/Page/Analyze.dart';
import 'package:mindcare/Page/UserInfo.dart';
import 'package:mindcare/Style/SoyoMaple.dart';
import 'package:mindcare/Page/UserInput.dart';
import 'package:mindcare/Page/firstInput.dart';
import 'package:mindcare/Page/splash.dart';
import '../widget/EmotionModal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TutorialCoachMark tutorialCoachMark;
  late SharedPreferences storage;
  bool isCompleteTuto = false;
  String userName = '';
  String userJob = '';
  bool wantVoice = true;
  String userBirth = '';
  late DateTime parsedUserBirth;
  bool needInfoSet = true;

  GlobalKey keyBottomAnalytics = GlobalKey();
  GlobalKey keyBottomAddDailyNote = GlobalKey();
  GlobalKey keyBottomInfo = GlobalKey();
  GlobalKey keyTopConstellation = GlobalKey();

  void initState() {
    super.initState();
    // 스플래시 화면 넣기
    init();
  }

  void init() async {
    await initStorage();
    await loadSavedData();
    if (userBirth.isNotEmpty) {
      DateFormat format = DateFormat('yyyy-MM-dd');
      parsedUserBirth = format.parse(userBirth);
    } else {
      parsedUserBirth = DateTime.now(); // userBirth가 비어있으면 현재 날짜를 기본값으로 설정
    }
    if (userName == '') {
      final result = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => firstInput(
                    userName: userName,
                    userJob: userJob,
                    userBirth: parsedUserBirth,
                  )));
      await loadSavedData();
      if (result == 'tutostart') {
        createTutorial();
        Future.delayed(Duration.zero, showTutorial);
      }
    }

    // info 입력
  }

  List<Offset> createConstellation1 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/image/background/homeback.jpg'),
              ),
            ),
          ),
          Positioned(
              key: keyTopConstellation,
              left: 10,
              top: 100,
              right: 0,
              child: StarPainterWidget(createConstellation1, Colors.white)),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Text(
                '',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            IconButton(
              key: keyBottomAnalytics,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnalyzePage(
                              userName: userName,
                            )));
                loadSavedData();
              },
              icon:
                  Icon(Icons.analytics_outlined, size: 60, color: Colors.white),
            ),
            IconButton(
              key: keyBottomAddDailyNote,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return EmotionModal();
                  },
                );
              },
              icon:
                  Icon(Icons.add_circle_outline, size: 90, color: Colors.white),
            ),
            IconButton(
              key: keyBottomInfo,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserInfo(
                              userName: userName,
                              userJob: userJob,
                              userBirth: parsedUserBirth,
                            )));
              },
              icon: Icon(Icons.settings, size: 60, color: Colors.white),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
        decoration: BoxDecoration(color: Color.fromRGBO(28, 33, 43, 1)),
      ),
    );
  }

  void showTutorial() {
    tutorialCoachMark.show(context: context);
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      colorShadow: Colors.transparent,
      textSkip: "스킵하기",
      paddingFocus: 10,
      opacityShadow: 0.5,
      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      onFinish: () {
        print("튜토리얼 끝");
        isCompleteTuto = true;
        storage.setBool('isCompleteTuto', isCompleteTuto);
        print('saved complete');
        showOurVoice(context, storage, wantVoice);
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onSkip: () {
        print('스킵');
        isCompleteTuto = true;
        storage.setBool('isCompleteTuto', isCompleteTuto);
        print('saved complete');
        showOurVoice(context, storage, wantVoice);
        return true;
      },
    );
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    targets.add(
      TargetFocus(
        identify: "keyBottomAnalytics",
        keyTarget: keyBottomAnalytics,
        alignSkip: Alignment.topCenter,
        enableOverlayTab: true,
        borderSide: BorderSide(color: Colors.white),
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "여기는 그동안의 내 감정과 \n${userName}의 편지를 다시 볼 수 있어!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'SoyoMaple',
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  )
                ],
              );
            },
          )
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyBottomAddDailyNote",
        keyTarget: keyBottomAddDailyNote,
        alignSkip: Alignment.topCenter,
        enableOverlayTab: true,
        borderSide: BorderSide(color: Colors.white),
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "여기에 감정을 기록해줘!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'SoyoMaple',
                        fontWeight: FontWeight.w400),
                  )
                ],
              );
            },
          )
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyBottomInfo",
        keyTarget: keyBottomInfo,
        alignSkip: Alignment.topCenter,
        enableOverlayTab: true,
        borderSide: BorderSide(color: Colors.white),
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "개인정보 수정 및 소중한 피드백은 여기에!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'SoyoMaple',
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  )
                ],
              );
            },
          )
        ],
      ),
    );
    return targets;
  }

  initStorage() async {
    storage = await SharedPreferences.getInstance();
    print('initStorage complete');
  }

  loadSavedData() async {
    isCompleteTuto = await storage.getBool('isCompleteTuto') ?? false;
    userName = await storage.getString('userName') ?? '';
    userJob = await storage.getString('userJob') ?? '';
    wantVoice = await storage.getBool('wantVoice') ?? true;
    userBirth = await storage.getString('userBirth') ?? '';
    print('loadSavedData complete');
  }
}
