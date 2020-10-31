import 'package:painter/enum.dart';
import 'package:painter/models/menu_info.dart';

import 'models/alarm_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(
    MenuType.clock,
    title: 'Clock',
    imageSource: 'assets/images/clock_icon.png',
  ),
  MenuInfo(
    MenuType.alarm,
    title: 'Alarm',
    imageSource: 'assets/images/alarm_icon.png',
  ),
  MenuInfo(
    MenuType.timer,
    title: 'Timer',
    imageSource: 'assets/images/timer_icon.png',
  ),
  MenuInfo(
    MenuType.stopwatch,
    title: 'Stopwatch',
    imageSource: 'assets/images/stopwatch_icon.png',
  )
];

List<AlarmInfo> alarmItems = [
  AlarmInfo(
    title: 'Office',
    alarmDateTime: DateTime.now().add(
      Duration(seconds: 10),
    ),
    isActive: true,
    gradientColorIndex: 1,
  ),
  AlarmInfo(
    title: 'Sport',
    alarmDateTime: DateTime.now().add(
      Duration(hours: 2),
    ),
    isActive: false,
    gradientColorIndex: 2,
  ),
];
