import 'package:flutter/material.dart';

class Homework7 extends StatefulWidget {
  const Homework7({super.key});

  @override
  State<Homework7> createState() => _Homework7State();
}

class _Homework7State extends State<Homework7> {
  var info = [
    ('미용실', '0636263665'),
    ('영희', '01012345678'),
    ('횟집', '01098765432'),
  ];
  var a = 100;

  addList(n, p) {
    setState(() {
      info.add((n, p));
      a++;
    });
  }

  sorting(d) {
    if(d == 1) {
      setState(() {
        info.sort((a, b) => a.$1.compareTo(b.$1));
      });
    } else {
      setState(() {
        info.sort((a, b) => b.$1.compareTo(a.$1));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(a.toString()),
        actions: [
          TextButton(
              onPressed: () {
                sorting(0);
              },
              child: Text('내림차순')
          ),
          TextButton(
              onPressed: () {
                sorting(1);
              },
              child: Text('오름차순')
          )
        ],
      ),
      body: ListView.builder(
          itemCount: info.length,
          itemBuilder: (context, i) {
            return ListTile(
              leading: Image.asset('assets/profile.png', width: 30, height: 30,),
              title: Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Row(
                  children: [
                    Text(info[i].$1),
                    Text('('+info[i].$2+')')
                  ],
                ),
              ),
              trailing: TextButton(
                  onPressed: () {
                    setState(() {
                      info.removeAt(i);
                    });
                  },
                  child: Text('삭제')
              )
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Button'),
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return DialogUI(addList: addList);
          });
        },
      ),
    );
  }
}



class DialogUI extends StatelessWidget {
  DialogUI({super.key, this.addList});

  var addList;
  var nameData = TextEditingController();
  var phoneData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          TextField(
            controller: nameData, // 이렇게 컨트롤러 말고도 onChange로 setState 써서 state 변경가능
          ),
          TextField(
            controller: phoneData, // 이렇게 컨트롤러 말고도 onChange로 setState 써서 state 변경가능
          ),
          TextButton(
              onPressed: () {
                if(nameData.text != "" || phoneData.text != "") {
                  addList(nameData.text, phoneData.text);
                  Navigator.pop(context);
                }
              },
              child: Text('완료')
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('취소')
          )
        ],
      ),
    );
  }
}
