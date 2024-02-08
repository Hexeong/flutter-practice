import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mindcare/store/CauseStore.dart';
import 'package:mindcare/Page/Today.dart';

class Cause extends StatelessWidget {
  const Cause({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 8;
    final double itemWidth = size.width / 2;

    var type = TextEditingController();

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/image/background_img.png"))),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                padding: EdgeInsets.all(10),
                width: size.width / 100 * 80,
                height: size.height / 100 * 36,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: Text(
                        "느낀 감정에 영향을 준 키워드가 있어?",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: Colors.black),
                      ),
                    ),
                    Expanded(
                        child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                        childAspectRatio:
                            itemWidth / itemHeight, //item 의 가로 1, 세로 2 의 비율
                        mainAxisSpacing: 5, //수평 Padding
                        crossAxisSpacing: 10, //수직 Padding
                      ),
                      itemBuilder: (c, i) => TextButton(
                          onPressed: () {
                            if (i ==
                                context.read<CauseStore>().cause.length - 1) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "직접 입력",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      content: TextField(
                                        controller: type,
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              context
                                                  .read<CauseStore>()
                                                  .changeType(type.text == ""
                                                      ? "이유 없음"
                                                      : type.text);
                                              Navigator.pop(context);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Today(),
                                                      settings: RouteSettings(
                                                          name: "/Today")));
                                            },
                                            child: Text(
                                              "확인",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "취소",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400),
                                            ))
                                      ],
                                    );
                                  });
                            } else {
                              context.read<CauseStore>().changeType(
                                  context.read<CauseStore>().cause[i]);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Today(),
                                      settings: RouteSettings(name: "/Today")));
                            }
                          },
                          child: Text(
                            context.read<CauseStore>().cause[i],
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          )
                          // 글자 크기 2배, 글자 검정색
                          ),
                      itemCount: context.read<CauseStore>().cause.length,
                    )),
                    // Container(
                    //   child: TextButton(
                    //       onPressed: () {
                    //
                    //       },
                    //       child: Padding(
                    //         child: Text("직접 작성", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),),
                    //         // padding: EdgeInsets.fromLTRB(itemWidth / 2, 20, itemWidth / 2, 20),
                    //         padding: EdgeInsets.all(10),
                    //       )
                    //   ),
                    // )
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
