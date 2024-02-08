import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mindcare/store/TodayStore.dart';

import 'package:mindcare/Page/Loading.dart';

class Today extends StatelessWidget {
  const Today({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var type = TextEditingController();

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/background_img.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.white),
                    width: size.width / 100 * 80,
                    height: size.height / 100 * 36,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
                              child: Text(
                                "오늘 어떤 하루를 보냈는지 작성해줘!",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                    color: Colors.black),
                              ),
                            )),
                        Expanded(
                            flex: 4,
                            child: TextFormField(
                              controller: type,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                            )),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                              onPressed: () {
                                context.read<TodayStore>().setTyping(type.text);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Loading()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white),
                              child: Text(
                                "확인",
                                style: TextStyle(fontWeight: FontWeight.w400),
                              )),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
