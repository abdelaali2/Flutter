import 'package:flutter/material.dart';
import 'package:moviesapp/CustomGridCard.dart';

import 'TVGridCard.dart';
import 'TVList.dart';
import 'data/model/TVResponse.dart';

class TVGrid extends StatelessWidget {
  TVGrid(this.tvShows, this._navigateToTVShow, {super.key});
  List<TVResults> tvShows;
  final void Function(TVResults) _navigateToTVShow;

  @override
  Widget build(BuildContext context) {
    List<TVResults> shortList = tvShows.sublist(0, 4);
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: GridView.builder(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: shortList.length + 1,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 2 / 0.8,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          if (index == shortList.length) {
            return InkWell(
              onTap: () {
                _showMore(context);
              },
              child: const CustomCard(),
            );
          } else {
            return InkWell(
                onTap: () {
                  _navigateToTVShow(shortList[index]);
                },
                child: TVGridCard(shortList[index]));
          }
        },
      ),
    );
  }

  void _showMore(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TVList(tvShows, _navigateToTVShow)));
  }
}
