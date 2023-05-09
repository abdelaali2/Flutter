// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class CustomBottomTabBar extends StatefulWidget {
  CustomBottomTabBar(this._controller, this._selectedIndex, {super.key});

  final TabController _controller;
  int _selectedIndex;

  @override
  State<CustomBottomTabBar> createState() => _CustomBottomTabBarState();
}

class _CustomBottomTabBarState extends State<CustomBottomTabBar> {
  @override
  void initState() {
    super.initState();
    widget._controller.addListener(() {
      setState(() {
        widget._selectedIndex = widget._controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TabBar(
        controller: widget._controller,
        indicator: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.deepOrange,
              width: 3.0,
            ),
          ),
        ),
        indicatorColor: Colors.transparent,
        labelColor: Colors.deepOrange,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(
            icon: Column(
              children: [
                Image.asset(
                  widget._selectedIndex == 0
                      ? 'assets/images/movie_filled.png'
                      : 'assets/images/movie_void.png',
                  width: 24.0,
                  height: 24.0,
                ),
                const Text('Movies'),
              ],
            ),
          ),
          Tab(
            icon: Column(
              children: [
                Image.asset(
                  widget._selectedIndex == 1
                      ? 'assets/images/tv_filled.png'
                      : 'assets/images/tv_void.png',
                  width: 24.0,
                  height: 24.0,
                ),
                const Text('TV'),
              ],
            ),
          ),
          Tab(
            icon: Column(
              children: [
                Image.asset(
                  widget._selectedIndex == 2
                      ? 'assets/images/profile_filled.png'
                      : 'assets/images/profile_void.png',
                  width: 24.0,
                  height: 24.0,
                ),
                const Text('Profile'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
