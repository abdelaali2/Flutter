import 'package:flutter/material.dart';
import 'package:moviesapp/utilities/SearchList.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: TextStyle(
          color: Colors.deepOrange[800],
        ),
        decoration: InputDecoration(
          hintText: 'Search ...',
          hintStyle: TextStyle(
            color: Colors.deepOrange[800],
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SearchList(value)));
        },
      ),
    );
  }
}