import 'package:flutter/material.dart';
import 'package:moviesapp/utilities/SearchList.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(75.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: const InputDecoration(
          hintText: 'Search ...',
          hintStyle: TextStyle(
            color: Colors.white70,
          ),
          contentPadding: EdgeInsets.symmetric(
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
