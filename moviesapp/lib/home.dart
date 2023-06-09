// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:moviesapp/tv/TVTab.dart';
import 'package:moviesapp/utilities/BottomTabBar.dart';
import 'package:moviesapp/utilities/CustomAppBar.dart';
import 'package:moviesapp/utilities/ProfileTab.dart';
import 'package:moviesapp/utilities/SearchBar.dart';

import 'movies/MoviesTab.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _controller;
  final int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomTabBar(_controller, _selectedIndex),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppBar(context: context),
        ],
        body: TabBarView(controller: _controller, children: [
          const MoviesTab(),
          const TVTab(),
          ProfileTab(),
        ]),
      ),
    );
  }
}
