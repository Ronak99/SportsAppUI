import 'package:sport_ui/model/latest_news_item.dart';
import 'package:sport_ui/model/sport_series.dart';
import 'package:sport_ui/model/sport_team.dart';

class SportNewsItem {
  SportTeam teamOne;
  SportTeam teamTwo;
  SportSeries series;
  LatestNewsItem latestNewsItem;
  int timestamp;
  SportNewsItem({
    required this.teamOne,
    required this.teamTwo,
    required this.series,
    required this.latestNewsItem,
    required this.timestamp,
  });
}
