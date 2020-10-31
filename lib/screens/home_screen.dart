import 'package:flutter/material.dart';
import 'package:painter/widgets/alarm_tab.dart';
import 'package:painter/widgets/clock_tab.dart';
import 'package:provider/provider.dart';

import '../data.dart';
import '../enum.dart';
import '../models/menu_info.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map(
                  (menu) => buidMenuButton(menu),
                )
                .toList(),
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1.0,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget child) {
                if (value.menuType == MenuType.clock) {
                  return ClockTab();
                } else if (value.menuType == MenuType.alarm) {
                  return AlarmTab();
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buidMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget child) {
        return FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          color: currentMenuInfo.menuType == value.menuType
              ? Color(0xFF242634)
              : Colors.transparent,
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          child: Column(
            children: [
              Image.asset(
                currentMenuInfo.imageSource,
                scale: 1.5,
              ),
              SizedBox(height: 16.0),
              Text(
                currentMenuInfo.title ?? '',
                style: TextStyle(
                  fontFamily: 'avenir',
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
