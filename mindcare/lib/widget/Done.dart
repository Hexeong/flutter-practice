import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mindcare/Page/Results.dart';

class Done extends StatefulWidget {
  const Done({super.key});

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  var name = "";

  @override
  initState() {
    super.initState();
    // await initPref();
  }

  initPref() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString("userName")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.fromLTRB(0, 0, 0, size.height / 100 * 20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 5),
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white),
          width: size.width / 100 * 80,
          height: size.height / 100 * 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: Text(
                  "짜잔!",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                child:
                    Text("너만을 위한 편지를 다 완성했어!", style: TextStyle(fontSize: 20)),
              ), // name =
              Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Text("보러 갈래?", style: TextStyle(fontSize: 20)),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(0, 12, 12, 12),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Results(),
                            settings: RouteSettings(name: "/Result")));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white),
                  child: Text("보러 가기", style: TextStyle(fontSize: 20)),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
