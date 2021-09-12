import 'package:jiffy/jiffy.dart';

class DateTimeFormatter {
  static String getRelativeTime(int timeInMillis, {bool shortenUnit = true}) {
    String _date =
        Jiffy(DateTime.fromMillisecondsSinceEpoch(timeInMillis)).fromNow();

    if (shortenUnit) {
      if (_date.contains('minutes')) {
        return _date.replaceFirst('minutes', 'mins');
      } else if (_date.contains('seconds')) {
        return _date.replaceFirst('seconds', 'secs');
      }
    }

    return _date;
  }
}
