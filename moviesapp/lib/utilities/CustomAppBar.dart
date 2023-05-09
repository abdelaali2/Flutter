import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key, required BuildContext context})
      : super(
          title: const Text('C I N E G U I D E'),
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
        );
}
