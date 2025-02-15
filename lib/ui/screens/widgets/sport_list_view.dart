import 'package:flutter/material.dart';

import 'package:sport_ui/constants/colors.dart';
import 'package:sport_ui/constants/numerics.dart';
import 'package:sport_ui/ui/widgets/fdotted_line.dart';

class SportListView extends StatelessWidget {
  const SportListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _sportList = ["cricket", "football", "basketball", "rugby"];
    final _selectedSportName = "cricket";

    return Container(
      height: 70,
      child: ListView.builder(
        itemCount: _sportList.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: defaultContainerMargin),
        itemBuilder: (context, index) => ListItemView(
          sport: _sportList[index],
          isSelected: _selectedSportName == _sportList[index],
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
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      child: FDottedLine(
        corner: FDottedLineCorner.all(10),
        color: isSelected ? highlightDark : Colors.transparent,
        space: 5,
        strokeWidth: 2.5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: highlightColor,
            border: Border.all(
              color: Color(0xfff6f4ff),
              width: 5,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/$sport.png", height: 28, width: 28),
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
      ),
    );
  }
}
