import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:painter/constants/theme_data.dart';
import 'package:painter/data.dart';

import '../main.dart';

class AlarmTab extends StatefulWidget {
  @override
  _AlarmTabState createState() => _AlarmTabState();
}

class _AlarmTabState extends State<AlarmTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alarm',
            style: TextStyle(
              fontFamily: 'avenir',
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
          Expanded(
            child: ListView(
              children: alarmItems.map<Widget>((alarm) {
                var alarmTime =
                    DateFormat('hh:mm aa').format(alarm.alarmDateTime);

                return Container(
                  margin: EdgeInsets.only(bottom: 32.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: GradientTemplate
                          .gradientTemplate[alarm.gradientColorIndex].colors,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: GradientTemplate
                            .gradientTemplate.last.colors.last
                            .withOpacity(0.2),
                        blurRadius: 8.0,
                        spreadRadius: 4.0,
                        offset: Offset(4, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(24.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.label,
                                color: Colors.white,
                                size: 24.0,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Office',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'avenir',
                                ),
                              ),
                            ],
                          ),
                          Switch(
                            value: alarm.isActive,
                            onChanged: (bool value) {},
                            activeColor: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        'Mon-Fri',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'avenir',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '07:00 AM',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'avenir',
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).followedBy([
                addAlarm(),
              ]).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget addAlarm() {
    return DottedBorder(
      strokeWidth: 2,
      color: Color(0xFFEAECFF),
      borderType: BorderType.RRect,
      radius: Radius.circular(24.0),
      dashPattern: [5, 4],
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF444974),
          borderRadius: BorderRadius.all(
            Radius.circular(24.0),
          ),
        ),
        child: FlatButton(
          onPressed: () {
            scheduleAlarm();
          },
          padding: EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 16.0,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/add_alarm.png',
                scale: 1.5,
              ),
              SizedBox(height: 8.0),
              Text(
                'Add Alarm',
                style: TextStyle(color: Colors.white, fontFamily: 'avenir'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void scheduleAlarm() async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 10));

    var androidPlatformChannelSpec = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'codex_logo',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('codex_logo'),
    );

    var iOSPlatformChannelSpec = IOSNotificationDetails(
      sound: 'a_long_cold_sting.wav',
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    var platformChannelSpec = NotificationDetails(
      androidPlatformChannelSpec,
      iOSPlatformChannelSpec,
    );

    await flutterLocalNotificationsPlugin.schedule(
      0,
      'Office',
      'Good morning! Time to office',
      scheduledNotificationDateTime,
      platformChannelSpec,
    );
  }
}
