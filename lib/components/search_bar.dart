import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:syncmusic/provider/search_bar_provider.dart';

class MySearchBar extends StatelessWidget implements PreferredSizeWidget {
  const MySearchBar({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 10, bottom: 10, right: 10, top: onTap == null ? 10 : 0),
      child: GestureDetector(
        onTap: onTap,
        child: TextFormField(
          autofocus: onTap == null,
          enabled: onTap == null,
          onChanged: (value) =>
              context.read<SearchBarProvider>().getSearchSuggestions(value),
          controller: context.read<SearchBarProvider>().textEditingController,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            hintText: "Search here..",
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight+2);
}
