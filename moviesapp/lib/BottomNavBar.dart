// ignore_for_file: file_names

import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicatorColor: Colors.deepPurple,
      labelColor: Colors.deepPurple,
      tabs: [
        Tab(
          // icon: SvgPicture.asset("assets/images/SVG/movies.svg"),
          // SVG Package conflicts with loading assets in the project.
          icon: Icon(Icons.movie),
          text: 'Movies',
        ),
        Tab(
          // icon: SvgPicture.asset("assets/images/SVG/tv.svg"),
          icon: Icon(Icons.tv),
          text: 'TV',
        ),
        Tab(
          // icon: SvgPicture.asset("assets/images/SVG/profile.svg"),
          icon: Icon(Icons.account_circle),
          text: 'Profile',
        ),
      ],
    );
  }
}
