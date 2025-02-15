import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import 'widgets/news_list_view.dart';
import 'widgets/section_title_view.dart';
import 'widgets/sport_list_view.dart';
import 'widgets/title_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f4ff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),

            // Custom app bar
            CustomAppBar(),

            SizedBox(height: 45),
            // Title and "See All" action button
            TitleView(),

            SizedBox(height: 40),
            // Sport list
            SportListView(),

            SizedBox(height: 40),
            // New section title
            SectionTitleView(),

            SizedBox(height: 20),
            // Actual news list
            NewsListView(),
          ],
        ),
      ),
    );
  }
}
