import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes/src/model/itunes_model.dart';

import '../model/itunes_grouped_model.dart';
import '../providers/search_provider.dart';
import '../viewmodel/search_itunes_viewmodel.dart';

class SearchWidget extends ConsumerWidget {
  const SearchWidget({super.key, required this.itunesData});
  final List<ITunesGroupedModel> itunesData;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: CupertinoSearchTextField(
        onChanged: (value) {
          ref.read(searchProvider.notifier).update((state) => state = value);
          ref
              .read(searchItunesProvider.notifier)
              .searchData(searchQuery, itunesData);
        },
        onSubmitted: (val) {
          ref.read(searchProvider.notifier).update((state) => state = val);
          ref
              .read(searchItunesProvider.notifier)
              .searchData(searchQuery, itunesData);
        },
        suffixMode: OverlayVisibilityMode.never,
      ),
    );
  }
}
