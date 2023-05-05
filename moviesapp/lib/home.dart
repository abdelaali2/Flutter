import 'package:flutter/material.dart';

import 'BottomNavBar.dart';
import 'MoviesTab.dart';
import 'TVTab.dart';

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
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              "assets/images/movie.png",
            ),
          ),
          title: const Text('CineGuide'),
          centerTitle: true,
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
        body: const TabBarView(children: [
          MoviesTab(),
          TVTab(),
          Center(child: Text('Tab 3')),
        ]),
      ),
    );
  }
}
