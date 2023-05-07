import 'package:flutter/material.dart';
import 'package:moviesapp/tv/TVTab.dart';
import 'package:moviesapp/utilities/BottomNavBar.dart';
import 'package:moviesapp/utilities/CustomAppBar.dart';
import 'package:moviesapp/utilities/SearchBar.dart';

import 'movies/MoviesTab.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          context: context,
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
        body: Column(
          children: const [
            SearchBar(),
            Expanded(
              child: TabBarView(children: [
                MoviesTab(),
                TVTab(),
                Center(child: Text('Profile Tab')),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
