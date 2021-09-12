import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sport_ui/constants/colors.dart';
import 'package:sport_ui/constants/numerics.dart';

class SportListView extends StatelessWidget {
  const SportListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _sportList = ["cricket", "football", "basketball", "rugby"];
    final _selectedSportName = "cricket";

    return Container(
      height: 70,
      margin: EdgeInsets.only(left: defaultContainerMargin),
      child: ListView.builder(
        itemCount: _sportList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ListItemView(
          sport: _sportList[index],
          isSelected: _sportList[index] == _selectedSportName,
        ),
      ),
    );
  }
}

class ListItemView extends StatelessWidget {
  final String sport;
  final bool isSelected;

  const ListItemView({
    Key? key,
    required this.sport,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      padding: EdgeInsets.all(5),
      dashPattern: [7],
      strokeWidth: 3,
      radius: Radius.circular(10),
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      color: isSelected ? highlightDark : Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: highlightColor),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/$sport.png",
              height: 28,
              width: 28,
            ),
            SizedBox(width: 15),
            Text(
              sport[0].toUpperCase() + sport.substring(1, sport.length),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: themeDarkColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
