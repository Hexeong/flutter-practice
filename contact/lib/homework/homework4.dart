import 'package:flutter/material.dart';

class Homework4 extends StatefulWidget {
  const Homework4({super.key});

  @override
  State<Homework4> createState() => _Homework4State();
}

class _Homework4State extends State<Homework4> {

  var like = [0, 0, 0];
  var name = ["김영숙", "홍길동", "피자집"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, i) {
            return ListTile(

              leading: Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text(like[i].toString()),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name[i]),
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          like[i]++;
                        });
                      },
                      child: Text("좋아요")
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}
