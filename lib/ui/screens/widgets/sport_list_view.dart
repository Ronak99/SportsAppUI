import 'package:dotted_border/dotted_border.dart';
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
          index: index,
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
  final int index;

  const ListItemView({
    Key? key,
    required this.sport,
    required this.index,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      child: FDottedLine(
        strokeWidth: 2.5,
        space: 5,
        color: isSelected ? highlightDark : Colors.transparent,
        corner: FDottedLineCorner.all(10),
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
      ),
    );
    // return DottedBorder(
    //   padding: EdgeInsets.all(5),
    //   dashPattern: [7],
    //   strokeWidth: 3,
    //   radius: Radius.circular(10),
    //   strokeCap: StrokeCap.round,
    //   borderType: BorderType.RRect,
    //   color: isSelected ? highlightDark : Colors.transparent,
    //   child: Container(
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10), color: highlightColor),
    //     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 22),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Image.asset(
    //           "images/$sport.png",
    //           height: 28,
    //           width: 28,
    //         ),
    //         SizedBox(width: 15),
    //         Text(
    //           sport[0].toUpperCase() + sport.substring(1, sport.length),
    //           style: TextStyle(
    //             fontSize: 17,
    //             fontWeight: FontWeight.w600,
    //             color: themeDarkColor,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
