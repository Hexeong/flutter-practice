import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mindcare/func/star.dart';
import 'package:mindcare/func/ourVoice.dart';
import 'package:mindcare/Page/Analyze.dart';
import 'package:mindcare/Page/UserInput.dart';

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
    if (isCompleteTuto == false) {
      createTutorial();
      Future.delayed(Duration.zero, showTutorial);
    } else {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        showOurVoice(context, storage, wantVoice);
      });
    }
  }

  List<Offset> createConstellation1 = [
    const Offset(50, 50),
    const Offset(100, 150),
    const Offset(150, 100),
    const Offset(200, 180),
    const Offset(250, 50),
    const Offset(223, 75),
    const Offset(153, 57),
    const Offset(120, 140),
    const Offset(140, 70),
    const Offset(69, 75),
    const Offset(89, 100),
    const Offset(0, 0),
    const Offset(400, 400),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image/background/hometutoback.jpg'),
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
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AnalyzePage()));
              },
              icon:
                  Icon(Icons.analytics_outlined, size: 60, color: Colors.white),
            ),
            IconButton(
              key: keyBottomAddDailyNote,
              onPressed: () {},
              icon:
                  Icon(Icons.add_circle_outline, size: 90, color: Colors.white),
            ),
            IconButton(
              key: keyBottomInfo,
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserInput()));
              },
              icon: Icon(Icons.person, size: 60, color: Colors.white),
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
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "여기는 그동안의 내 감정과 (캐릭터 이름)의 편지를 다시 볼 수 있어!",
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 25,
                      fontFamily: 'SoyoMaple',
                      fontWeight: FontWeight.w400
                      ),
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
                      fontWeight: FontWeight.w400
                      ),
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
                      fontWeight: FontWeight.w400
                    ),
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
    userName = await storage.getString('userName') ?? 'Null';
    userJob = await storage.getString('userJob') ?? 'Null';
    wantVoice = await storage.getBool('wantVoice') ?? true;
    print('loadSavedData complete');
  }
}
