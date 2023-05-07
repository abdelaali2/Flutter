import 'package:flutter/material.dart';
import 'package:moviesapp/tv/TVTab.dart';
import 'package:moviesapp/utilities/BottomNavBar.dart';
import 'package:moviesapp/utilities/CustomAppBar.dart';

import 'movies/MoviesTab.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(),
        bottomNavigationBar: CustomBottomNavBar(),
        body: TabBarView(children: [
          MoviesTab(),
          TVTab(),
          Center(child: Text('Profile Tab')),
        ]),
      ),
    );
  }
}
