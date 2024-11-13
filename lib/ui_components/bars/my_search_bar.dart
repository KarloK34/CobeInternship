import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/providers/notifier_providers/search_query_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MySearchBar extends ConsumerStatefulWidget {
  const MySearchBar({
    super.key,
  });

  @override
  ConsumerState<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends ConsumerState<MySearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    _controller.addListener(() {
      final query = _controller.text;
      ref.read(searchQueryNotifierProvider.notifier).updateSearchQuery(query);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: SearchBar(
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
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
