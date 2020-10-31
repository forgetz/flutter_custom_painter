class AlarmInfo {
  int id;
  String title;
  DateTime alarmDateTime;
  bool isActive;
  int gradientColorIndex;

  AlarmInfo(
      {this.id,
      this.title,
      this.alarmDateTime,
      this.isActive,
      this.gradientColorIndex});

  factory AlarmInfo.fromMap(Map<String, dynamic> json) => AlarmInfo(
        id: json["id"],
        title: json["title"],
        alarmDateTime: DateTime.parse(json["alarmDateTime"]),
        isActive: json["isActive"],
        gradientColorIndex: json["gradientColorIndex"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "alarmDateTime": alarmDateTime.toIso8601String(),
        "isActive": isActive,
        "gradientColorIndex": gradientColorIndex,
      };
}
