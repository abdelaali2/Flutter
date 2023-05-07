import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key, required BuildContext context})
      : super(
          title: const Text('CineGuide'),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Image.asset(
                "assets/images/movie.png",
              ),
            ),
          ],
        );
}
