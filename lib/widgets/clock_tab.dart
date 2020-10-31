import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'clock_widget.dart';

class ClockTab extends StatefulWidget {
  @override
  _ClockTabState createState() => _ClockTabState();
}

class _ClockTabState extends State<ClockTab> {
  @override
  Widget build(BuildContext context) {
    var dateNow = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(dateNow);
    var formattedDate = DateFormat('EEE, d MMM').format(dateNow);
    var timezoneString = dateNow.timeZoneOffset.toString().split('.').first;
    var offsetSign = !timezoneString.startsWith('-') ? '+' : '';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'Clock',
              style: TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
          SizedBox(height: 32.0),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedTime,
                  style: TextStyle(
                    fontFamily: 'avenir',
                    color: Colors.white,
                    fontSize: 64.0,
                  ),
                ),
                Text(
                  formattedDate,
                  style: TextStyle(
                    fontFamily: 'avenir',
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.center,
              child: ClockWidget(
                size: MediaQuery.of(context).size.height / 4,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Timezone',
                  style: TextStyle(
                    fontFamily: 'avenir',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      'UTC' + offsetSign + timezoneString,
                      style: TextStyle(
                        fontFamily: 'avenir',
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
