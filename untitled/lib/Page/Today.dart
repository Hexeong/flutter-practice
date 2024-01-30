import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Page/Result.dart';
import 'package:untitled/store/CauseStore.dart';
import 'package:untitled/store/TodayStore.dart';

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
            image: DecorationImage(image: AssetImage("assets/background_img.png"), fit: BoxFit.cover)
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(backgroundColor: Colors.transparent,),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: Text("오늘 어떤 하루를 보냈는지 작성해줘!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white
                  ),
                  width: size.width / 100 * 65,
                  height: size.height / 100 * 25,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: type,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<TodayStore>().setTyping(type.text);

                        // GPTs Logic

                        Navigator.push(context, MaterialPageRoute(builder: (context) => Result()));
                      },
                      child: Text("확인")
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
