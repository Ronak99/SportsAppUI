import 'package:sport_ui/constants/strings.dart';
import 'package:sport_ui/model/models.dart';

class SportTeamData {
  static SportTeam teamIndia = SportTeam(
    teamIcon: indianTeamIcon,
    teamName: "India",
    score: "283",
  );
  static SportTeam teamEngland = SportTeam(
    teamIcon: englandTeamIcon,
    teamName: "England",
    score: "183/6",
  );
  static SportTeam teamSydney = SportTeam(
    teamIcon: indianTeamIcon,
    teamName: "Sydney",
    score: "283",
  );
  static SportTeam teamAdelaide = SportTeam(
    teamIcon: indianTeamIcon,
    teamName: "Adelaide",
    score: "283",
  );
}

class SportSeriesData {
  static SportSeries paytmOdiSeries = SportSeries(
      seriesName: "PAYTM ODI Series",
      seriesSponsorLogo: paytmLogo,
      seriesSponsorName: "Paytm");

  static SportSeries kfcBigBashSeries = SportSeries(
      seriesName: "KFC Big Bash",
      seriesSponsorLogo: paytmLogo,
      seriesSponsorName: "KFC");
}

class LatestNewsItemData {
  static LatestNewsItem paytmSeriesNewsItemData = LatestNewsItem(
    timestamp: DateTime.now().millisecondsSinceEpoch,
    title: "Watch the epic clash of India and England",
    videoThumbnail: cricketImageLogo,
  );
}

class NewsData {
  static SportNewsItem _sportNewsItemOne = SportNewsItem(
    teamOne: SportTeamData.teamIndia,
    teamTwo: SportTeamData.teamEngland,
    series: SportSeriesData.paytmOdiSeries,
    latestNewsItem: LatestNewsItemData.paytmSeriesNewsItemData,
    timestamp: DateTime.now().millisecondsSinceEpoch,
  );

  static SportNewsItem _sportNewsItemTwo = SportNewsItem(
    teamOne: SportTeamData.teamSydney,
    teamTwo: SportTeamData.teamAdelaide,
    series: SportSeriesData.kfcBigBashSeries,
    latestNewsItem: LatestNewsItemData.paytmSeriesNewsItemData,
    timestamp: DateTime.now().millisecondsSinceEpoch,
  );

  static List<SportNewsItem> sportNewsItemList = [
    _sportNewsItemOne,
    _sportNewsItemTwo
  ];
}
