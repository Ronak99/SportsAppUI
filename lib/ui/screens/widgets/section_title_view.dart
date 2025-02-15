import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/numerics.dart';

class SectionTitleView extends StatelessWidget {
  const SectionTitleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultContainerMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "News",
            style: TextStyle(
              color: themeDarkColor,
              fontSize: 35,
              letterSpacing: .5,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "See All",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 15,
              letterSpacing: .5,
            ),
          ),
        ],
      ),
    );
  }
}
