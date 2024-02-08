import 'package:flutter/material.dart';

class Waiting extends StatelessWidget {

  const Waiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 230, 0, 10),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("image/loading.gif")
              )
          ),
        ),
        Container(
          child: Text("잠시만 기다려줘!",
            style: TextStyle(
                color: Colors.black
            ),
          ),
        ),
        Container(
          child: Text("열심히 편지를 작성하고 있어!",
            style: TextStyle(
                color: Colors.black
            ),
          ),
        )
      ],
    );
  }
}
