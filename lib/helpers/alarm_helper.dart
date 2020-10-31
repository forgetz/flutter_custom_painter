import 'package:painter/models/alarm_info.dart';
import 'package:sqflite/sqflite.dart';

final String tableAlarm = 'alarm';
final String colId = 'id';
final String colTitle = 'title';
final String colDateTime = 'alarmDateTime';
final String colActive = 'isActive';
final String colColorIndex = 'gradientColorIndex';

class AlarmHelper {
  static Database _database;
  static AlarmHelper _alarmHelper;

  AlarmHelper._createInstance();
  factory AlarmHelper() {
    if (_alarmHelper == null) {
      _alarmHelper = AlarmHelper._createInstance();
    }
    return _alarmHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + 'alarm.db';

    var database = openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tableAlarm ( 
            $colId integer primary key autoincrement, 
            $colTitle text not null,
            $colDateTime text not null,
            $colActive integer,
            $colColorIndex integer
          )
        ''');
      },
    );

    void insertAlarm(AlarmInfo alarmInfo) async {
      var db = await this.database;
      var result = await db.insert(tableAlarm, alarmInfo.toMap());
      print('result : $result');
    }

    Future<List<AlarmInfo>> getAlarms() async {
      List<AlarmInfo> _alarms = [];

      var db = await this.database;
      var result = await db.query(tableAlarm);
      result.forEach((element) {
        var alarmInfo = AlarmInfo.fromMap(element);
        _alarms.add(alarmInfo);
      });

      return _alarms;
    }

    Future<int> deleteAlarm(int id) async {
      var db = await this.database;
      return await db.delete(tableAlarm, where: '$colId = ?', whereArgs: [id]);
    }

    return database;
  }
}
