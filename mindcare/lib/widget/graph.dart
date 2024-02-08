import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mindcare/Style/SoyoMaple.dart';

Map emotions = {'속상한': 38, '답답한': 27, '미운': 14, '초조한': 21};

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
            centerSpaceRadius: 0,
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
      final double radius = isTouched ? 200 : 170;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color(0xffc1aae2),
            value: emotions['속상한'].toDouble(),
            title: '속상한 \n(${emotions['속상한'].toDouble()}%)',
            radius: radius,
            showTitle: true,
            titleStyle: soyoMaple700_20_black,
          );
        case 1:
          return PieChartSectionData(
            color: Color(0xff9eb4e3),
            value: emotions['답답한'].toDouble(),
            title: '답답한 \n(${emotions['답답한'].toDouble()}%)',
            showTitle: true,
            radius: radius,
            titleStyle: soyoMaple700_20_black,
          );
        case 2:
          return PieChartSectionData(
            color: Color(0xfff6c1c1),
            value: emotions['미운'].toDouble(),
            title: '미운 \n(${emotions['미운'].toDouble()}%)',
            radius: radius,
            showTitle: true,
            titleStyle: soyoMaple700_20_black,
          );
        case 3:
          return PieChartSectionData(
            color: Color(0xffafe39e),
            value: emotions['초조한'].toDouble(),
            title: '초조한 \n(${emotions['초조한'].toDouble()}%)',
            radius: radius,
            showTitle: true,
            titleStyle: soyoMaple700_20_black,
          );
        default:
          throw ('Unknown emotion');
      }
    });
  }
}
