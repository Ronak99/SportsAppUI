import 'latest_news_item.dart';
import 'sport_series.dart';
import 'sport_team.dart';

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
