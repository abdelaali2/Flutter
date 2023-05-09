import 'package:flutter/material.dart';

class GridMoreCard extends StatelessWidget {
  const GridMoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 225,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
            image: const DecorationImage(
              image: AssetImage("assets/images/launcher.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Text(
              "More",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(),
      ],
    );
  }
}
