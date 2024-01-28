import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:untitled/store/CauseStore.dart';
import 'package:untitled/Page/Today.dart';

class Cause extends StatelessWidget {
  const Cause({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 7;
    final double itemWidth = size.width / 2;

    var type = TextEditingController();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/background_img.png")
        )
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Text("느낀 감정에 영향을 준 키워드가 있어?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white
                ),
                width: size.width / 100 * 90,
                height: size.height / 100 * 50,
                child: Column(
                  children: [
                    Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                            childAspectRatio: itemWidth / itemHeight, //item 의 가로 1, 세로 2 의 비율
                            mainAxisSpacing: 10, //수평 Padding
                            crossAxisSpacing: 10, //수직 Padding
                          ),
                          itemBuilder: (c, i) => TextButton(
                              onPressed: () {
                                context.read<CauseStore>().changeType(context.read<CauseStore>().cause[i]);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Today()));
                              },
                              child: Text(context.read<CauseStore>().cause[i])
                          ),
                          itemCount: context.read<CauseStore>().cause.length,
                        )
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextButton(
                          onPressed: () {
                            showDialog(
                                context: context, 
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("직접 입력"),
                                    content: TextField(
                                      controller: type,
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            context.read<CauseStore>().changeType(type.text);
                                            Navigator.pop(context);
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Today()));
                                          }, 
                                          child: Text("확인")
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }, 
                                          child: Text("취소")
                                      )
                                    ],
                                  );
                                }
                            );
                          },
                          child: Text("직접작성")
                      ),
                    )
                  ],
                )
              )
            ],
          )
        ),
      ),
    );
  }
}