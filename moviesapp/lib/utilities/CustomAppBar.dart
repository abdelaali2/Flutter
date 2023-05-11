import 'package:flutter/material.dart';
import 'package:moviesapp/utilities/SearchBar.dart';

class CustomAppBar extends SliverAppBar {
  CustomAppBar({super.key, required BuildContext context})
      : super(
          pinned: true,
          floating: true,
          snap: true,
          expandedHeight: 125,
          backgroundColor: Colors.deepOrange,
          title: const Text(
            'C I N E G U I D E',
            style: TextStyle(
              letterSpacing: 2.0,
            ),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange[600],
              ),
            ),
          ),
          bottom: const SearchBar(),
        );
}
