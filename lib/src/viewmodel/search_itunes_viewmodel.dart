import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes/src/model/itunes_model.dart';

import '../model/itunes_grouped_model.dart';

final searchItunesProvider =
    StateNotifierProvider<SearchViewModel, List<ITunesGroupedModel>>((ref) {
  return SearchViewModel();
});

class SearchViewModel extends StateNotifier<List<ITunesGroupedModel>> {
  SearchViewModel() : super([]);

  void searchData(String query, List<ITunesGroupedModel> data) {
    state = data
        .map((group) => ITunesGroupedModel(
              title: group.title,
              data: group.data
                  .where((item) => (item.trackName ?? '')
                      .toLowerCase()
                      .contains(query.toLowerCase()))
                  .toList(),
            ))
        .where((group) => group.data.isNotEmpty)
        .toList();
  }
}
