import 'package:jiffy/jiffy.dart';

class DateTimeFormatter {
  static String getRelativeTime(int timeInMillis) {
    String _date =
        Jiffy(DateTime.fromMillisecondsSinceEpoch(timeInMillis)).fromNow();

    // Custom logic to shorten the time returned
    if (_date == "a few seconds ago") {
      return "1 sec ago";
    } else if (_date == "a minute ago") {
      return "<1 min ago";
    } else if (_date.contains("minutes")) {
      return _date.replaceAll("minutes", "mins");
    } else if (_date.contains("seconds")) {
      return _date.replaceAll("seconds", "secs");
    }

    return _date;
  }
}
