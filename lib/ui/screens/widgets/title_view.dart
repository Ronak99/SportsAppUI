import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/numerics.dart';

class TitleView extends StatelessWidget {
  const TitleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultContainerMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 35,
                color: themeDarkColor,
                fontFamily: 'urbanist',
                letterSpacing: .5,
              ),
              children: [
                TextSpan(text: "Select your\n"),
                TextSpan(
                  text: "Favourite sport",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          SeeAllButton(),
        ],
      ),
    );
  }
}

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff6c6a78),
            Color(0xff4d4b57),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(35),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: Text(
        "See All",
        style: TextStyle(
          fontSize: 15,
          letterSpacing: .5,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
