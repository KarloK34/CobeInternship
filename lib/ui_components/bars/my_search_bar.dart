import 'package:first_project/cubits/search_query_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({
    super.key,
  });

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    _controller.addListener(() {
      final query = _controller.text;
      context.read<SearchQueryCubit>().updateSearchQuery(query);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _controller,
      elevation: const WidgetStatePropertyAll(0),
      leading: SizedBox(
        height: 20,
        width: 20,
        child: Icon(
          Icons.search,
          color: context.onBackgroundVariant,
        ),
      ),
      hintText: 'Search...',
      hintStyle: WidgetStatePropertyAll(
        context.labelMedium!.copyWith(color: context.onBackgroundVariant),
      ),
      backgroundColor: WidgetStatePropertyAll(context.onSecondary),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
