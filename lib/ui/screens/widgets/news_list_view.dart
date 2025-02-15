import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/numerics.dart';

import '../../../data/app_data.dart';
import '../../../model/sport_news_item.dart';
import '../../../model/sport_team.dart';
import '../../../model/latest_news_item.dart';
import '../../../utils/date_time_formatter.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: NewsData.sportNewsItemList
          .map((e) => NewsItemCard(sportNewsItem: e as SportNewsItem))
          .toList(),
    );
  }
}

class NewsItemCard extends StatelessWidget {
  final SportNewsItem sportNewsItem;

  const NewsItemCard({
    Key? key,
    required this.sportNewsItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultContainerMargin,
        right: defaultContainerMargin,
        bottom: 15,
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: highlightColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    // Sponsor logo
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white70,
                        ),
                        child: Image.network(
                          sportNewsItem.series.seriesSponsorLogo,
                          height: 45,
                          width: 45,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Match day and series name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Match Day",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                            letterSpacing: .5,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          sportNewsItem.series.seriesName,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            letterSpacing: .5,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Team score view row
                Row(
                  children: [
                    Expanded(
                      child: TeamScoreView(
                        direction: TeamScoreViewDirection.ltr,
                        team: sportNewsItem.teamOne,
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: TeamScoreView(
                        direction: TeamScoreViewDirection.rtl,
                        team: sportNewsItem.teamTwo,
                      ),
                    ),
                  ],
                ),
                DashedLine(
                  color: Colors.grey.withOpacity(.5),
                ),
                CallToActionView(
                  latestNewsItem: sportNewsItem.latestNewsItem,
                ),
              ],
            ),
          ),
          // Top right tag
          Positioned(
            top: 0,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 1,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                DateTimeFormatter.getRelativeTime(sportNewsItem.timestamp),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum TeamScoreViewDirection {
  ltr,
  rtl,
}

class TeamScoreView extends StatelessWidget {
  final TeamScoreViewDirection direction;
  final SportTeam team;

  const TeamScoreView({
    Key? key,
    required this.direction,
    required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _viewWidth = 95;
    const double _viewHeight = 33;

    Widget _teamName() => Text(
          team.teamName,
          style: TextStyle(
            fontSize: 13,
            letterSpacing: .3,
            color: themeDarkColor,
            fontWeight: FontWeight.w600,
          ),
        );

    Widget _scoreView() {
      EdgeInsets _scorePadding = direction == TeamScoreViewDirection.ltr
          ? EdgeInsets.only(right: 25)
          : EdgeInsets.only(left: 25);

      return Container(
        width: _viewWidth,
        height: _viewHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: _scorePadding,
              width: _viewWidth - 10,
              height: _viewHeight,
              decoration: BoxDecoration(
                color: themeDarkColor,
                borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.center,
              child: Text(
                team.score!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
            Align(
              alignment: direction == TeamScoreViewDirection.ltr
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: CircleAvatar(
                backgroundImage: NetworkImage(team.teamIcon),
              ),
            ),
          ],
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: direction == TeamScoreViewDirection.ltr
          ? [_teamName(), _scoreView()]
          : [_scoreView(), _teamName()],
    );
  }
}

class DashedLine extends StatelessWidget {
  final double height;
  final Color color;

  const DashedLine({this.height = 1.5, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18, bottom: 18),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashWidth = 5.0;
          final dashHeight = height;
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
          );
        },
      ),
    );
  }
}

class CallToActionView extends StatelessWidget {
  final LatestNewsItem latestNewsItem;

  const CallToActionView({
    Key? key,
    required this.latestNewsItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 75,
          width: 100,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    latestNewsItem.videoThumbnail,
                    width: 90,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xfff3757b),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xfff3757b),
                        blurRadius: 8,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    latestNewsItem.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      letterSpacing: .5,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  DateTimeFormatter.getRelativeTime(latestNewsItem.timestamp),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
