import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/numerics.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultContainerMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomMenuIcon(),
          Icon(Icons.notifications, size: 25, color: themeDarkColor),
        ],
      ),
    );
  }
}

class CustomMenuIcon extends StatelessWidget {
  const CustomMenuIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _dotView() {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: themeDarkColor,
        ),
        height: 4,
        width: 4,
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: .5,
          color: themeDarkColor.withOpacity(.5),
        ),
      ),
      height: 50,
      width: 50,
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_dotView(), _dotView()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_dotView(), _dotView()],
          ),
        ],
      ),
    );
  }
}
