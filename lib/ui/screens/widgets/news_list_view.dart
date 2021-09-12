import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:sport_ui/constants/colors.dart';
import 'package:sport_ui/constants/numerics.dart';
import 'package:sport_ui/constants/strings.dart';
import 'package:sport_ui/data/sport_team_data.dart';
import 'package:sport_ui/model/models.dart';

class NewsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: NewsData.sportNewsItemList
          .map((e) => NewsItemCard(sportNewsItem: e))
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
          bottom: 15),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: highlightColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                        child: Image.network(
                          paytmLogo,
                          height: 45,
                          width: 45,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Match Day",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          sportNewsItem.series.seriesName,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                // Team score view
                Row(
                  children: [
                    Expanded(
                      child: TeamScoreView(
                        team: sportNewsItem.teamOne,
                        direction: TeamScoreViewDirection.ltr,
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: TeamScoreView(
                        team: sportNewsItem.teamTwo,
                        direction: TeamScoreViewDirection.rtl,
                      ),
                    ),
                  ],
                ),

                DashedLine(
                  color: Colors.grey.withOpacity(.5),
                ),
                // Call to action
                CallToActionView(latestNewsItem: sportNewsItem.latestNewsItem),
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 1,
                    spreadRadius: 2,
                    offset: Offset(
                      0,
                      3,
                    ),
                  ),
                ],
              ),
              child: Text(
                "5 mins ago",
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
  final SportTeam team;
  final TeamScoreViewDirection direction;

  const TeamScoreView({
    Key? key,
    required this.team,
    required this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _viewWidth = 95;
    const double _viewHeight = 33;

    Widget _teamName() => Text(
          team.teamName,
          style: TextStyle(
            fontSize: 13,
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
                borderRadius: BorderRadius.circular(25),
                color: themeDarkColor,
              ),
              alignment: Alignment.center,
              child: Text(
                team.score!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
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
          height: 80,
          width: 100,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    latestNewsItem.videoThumbnail,
                    width: 100,
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
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  '3 mins',
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
