import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:painter/enum.dart';
import 'package:painter/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'models/menu_info.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initSettingsAndroid = AndroidInitializationSettings('codex_logo');
  var initSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification: (id, title, body, payload) async {},
  );

  var initSettings =
      InitializationSettings(initSettingsAndroid, initSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(
    initSettings,
    onSelectNotification: (payload) async {
      if (payload != null) {
        debugPrint('notification payload: ' + payload);
      }
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Painter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
        create: (context) => MenuInfo(MenuType.clock),
        child: HomeScreen(),
      ),
    );
  }
}
