import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class BirthDatePicker extends StatelessWidget {
  final void Function(DateTime) onDateTimeChanged;
  final String initDateStr;

  BirthDatePicker({
    required this.onDateTimeChanged,
    required this.initDateStr,
  });

  @override
  Widget build(BuildContext context) {
    final initDate = DateFormat('yyyy-MM-dd').parse(initDateStr ?? '2000-01-01');
    final maximumYear = DateTime.now().year; // 최대 연도를 현재 연도로 설정

    return SizedBox(
      height: 300,
      child: CupertinoDatePicker(
        minimumYear: 1900,
        maximumYear: maximumYear,
        initialDateTime: initDate.isAfter(DateTime(maximumYear, 1, 1))
            ? DateTime(maximumYear, 1, 1)
            : initDate,
        onDateTimeChanged: onDateTimeChanged,
        mode: CupertinoDatePickerMode.date,
      ),
    );
  }
}
