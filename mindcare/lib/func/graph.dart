import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

Map emotions = {'anger': 21, 'sad': 13, 'happy': 50, 'annoy': 16};

class DrawGraph extends StatefulWidget {
  const DrawGraph({super.key});

  @override
  State<DrawGraph> createState() => _DrawGraphState();
}

class _DrawGraphState extends State<DrawGraph> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      child: AspectRatio(
        aspectRatio: 2.1,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 40,
            sections: showingSections(),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 40 : 25;
      final double radius = isTouched ? 150 : 150;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.amber,
            value: emotions['happy'].toDouble(),
            title: 'happy',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontFamily: 'SoyoMaple',
              fontWeight: FontWeight.w400, 
              color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red.shade600,
            value: emotions['anger'].toDouble(),
            title: 'anger',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize, 
              fontFamily: 'SoyoMaple',
              fontWeight: FontWeight.w400, 
              color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.indigoAccent.shade100,
            value: emotions['annoy'].toDouble(),
            title: 'annoyed',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize, 
              fontFamily: 'SoyoMaple',
              fontWeight: FontWeight.w400, 
              color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.purple.shade600,
            value: emotions['sad'].toDouble(),
            title: 'sad',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize, 
              fontFamily: 'SoyoMaple',
              fontWeight: FontWeight.w400, 
              color: const Color(0xffffffff)),
          );
        default:
          throw ('Unknown emotion');
      }
    });
  }
}