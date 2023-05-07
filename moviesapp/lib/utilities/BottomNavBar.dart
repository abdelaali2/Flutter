// ignore_for_file: file_names

import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.deepOrange,
      labelColor: Colors.deepOrange,
      tabs: [
        Tab(
          // icon: SvgPicture.asset("assets/images/SVG/movies.svg"),
          // SVG Package conflicts with loading assets in the project.
          icon: Image.asset(
            'assets/images/tab1.png',
            width: 24.0,
            height: 24.0,
          ),
          text: 'Movies',
        ),
        Tab(
          // icon: SvgPicture.asset("assets/images/SVG/tv.svg"),
          icon: Image.asset(
            'assets/images/tv.png',
            width: 24.0,
            height: 24.0,
          ),
          text: 'TV',
        ),
        Tab(
          // icon: SvgPicture.asset("assets/images/SVG/profile.svg"),
          icon: Image.asset(
            'assets/images/profile.png',
            width: 24.0,
            height: 24.0,
          ),
          text: 'Profile',
        ),
      ],
    );
  }
}
