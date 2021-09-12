
class SportTeam {
  String teamName;
  String teamIcon;
  String? score;
  SportTeam({
    required this.teamName,
    required this.teamIcon,
    this.score,
  });
}

class SportSeries {
  String seriesName;
  String seriesSponsorName;
  String seriesSponsorLogo;
  SportSeries({
    required this.seriesName,
    required this.seriesSponsorName,
    required this.seriesSponsorLogo,
  });
}

class LatestNewsItem {
  String videoThumbnail;
  String title;
  int timestamp;
  LatestNewsItem({
    required this.videoThumbnail,
    required this.title,
    required this.timestamp,
  });
}

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