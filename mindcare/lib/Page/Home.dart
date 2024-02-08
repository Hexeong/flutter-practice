import 'package:flutter/material.dart';

import '../widget/EmotionModal.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/background_img.png"))),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return EmotionModal();
                          },
                        );
                      },
                      child: Text(
                        "감정",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ))
                ],
              ),
            )));
  }
}
