import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final notifications = FlutterLocalNotificationsPlugin();


// 앱 로드시 실행할 기본 설정
initNotification() async {
  // 안드로이드용 아이콘 파일 이름
  var androidSetting = AndroidInitializationSettings('app_icon');

  // ios에서 앱 로드시 유저에게 권한요청하려면
  var iosSetting = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true
  );

  var initializationSettings = InitializationSettings(
    android: androidSetting,
    iOS: iosSetting
  );

  await notifications.initialize(
    initializationSettings,
    // 알림 누를때 함수 실행하고 싶으면
    // onSelectNotification: 함수명 추가
  );
}

showNotification() async {
  tz.initializeTimeZones();

  var androidDetails = AndroidNotificationDetails(
    '유니크한 알림 채널 ID',
    '알림 종류 설명',
    priority: Priority.high, // 알림 소리 날지 말지
    importance: Importance.max, // 팝업 띄울지 말지
    color: Color.fromARGB(255, 255, 0, 0)
  );

  var iosDetails = IOSNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true // 소리 켤지 말지
  );

  notifications.show(
      1,
      "title",
      "content",
      NotificationDetails(android: androidDetails, iOS: iosDetails)
  ); // 만약 주기적으로 보내고 싶으면 notification.zonedScheduled()
}

showNotification2() async {
  tz.initializeTimeZones();

  var androidDetails = AndroidNotificationDetails(
      '유니크한 알림 채널 ID',
      '알림 종류 설명',
      priority: Priority.high, // 알림 소리 날지 말지
      importance: Importance.max, // 팝업 띄울지 말지
      color: Color.fromARGB(255, 255, 0, 0)
  );

  var iosDetails = IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true // 소리 켤지 말지
  );

  notifications.zonedSchedule(
      2,
      'title',
      'content',
      tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
      NotificationDetails(android: androidDetails, iOS: iosDetails),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true
  ); // 만약 매일 귀찮게 알림을 띄울려면 notifications.periodicallyShow()를 쓰면 됨.
  // 이렇게 짜면 시간 지정이 앱을 켠 순간으로 됨
  // await notifications.cancel(0); 으로 예정된 알림 취소 가능
  // await notifications.cancelAll();
}

makeDate(hour, min, sec) {
  var now = tz.TZDateTime.now(tz.local);
  var when = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, min, sec);
  if(when.isBefore(now)) {
    return when.add(Duration(days: 1));
  } else {
    return when;
  }
} // zonedSchedule에 content 다음으로 넣어주면 됨. 같은 시간에 매일 띄우고 싶은 용도