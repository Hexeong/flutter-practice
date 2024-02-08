import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:mindcare/Style/SoyoMaple.dart'; // 가정하는 스타일
import 'package:mindcare/store/EmotionStore.dart'; // 가정하는 스토어

class DrawGraph extends StatefulWidget {
  const DrawGraph({super.key});

  @override
  State<DrawGraph> createState() => _DrawGraphState();
}

class _DrawGraphState extends State<DrawGraph> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Map<String, int> emotions =
        context.read<EmotionStore>().json.cast<String, int>();

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
            sections: _showingSections(emotions),
          ),
        ),
      ),
    );
  }

  List<Color> emotionColors = [
    Color(0xffc1aae2),
    Color(0xff9eb4e3),
    Color(0xfff6c1c1),
    Color(0xffafe39e),
    Color(0xff9eafe3),
    Color(0xffe39eaf),
    // 기타 색상 추가 가능
  ];

  List<PieChartSectionData> _showingSections(Map<String, int> emotions) {
    int total = emotions.values.fold(0, (sum, item) => sum + item);

    List<PieChartSectionData> sections = [];
    int colorIndex = 0;

    emotions.forEach((emotion, value) {
      final isTouched = colorIndex == touchedIndex;
      final double fontSize = isTouched ? 25 : 20;
      final double radius = isTouched ? 200 : 170;
      final double percent = (value.toDouble() / total) * 100;

      PieChartSectionData section = PieChartSectionData(
        color: emotionColors[colorIndex % emotionColors.length],
        value: percent,
        title: '$emotion \n(${percent.toStringAsFixed(0)}%)',
        radius: radius,
        titlePositionPercentageOffset: 0.55,
        showTitle: true,
        titleStyle: soyoMaple700_20_black, // 가정하는 스타일 속성, 적절히 수정 필요
      );

      sections.add(section);
      colorIndex++;
    });

    return sections;
  }
}
