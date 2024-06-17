import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/itunes_grouped_model.dart';
import '../model/itunes_model.dart';
import '../services/api_service.dart';

final iTunesProvider = FutureProvider<List<ITunesGroupedModel>>((ref) async {
  return await ApiService()
      .getiTunesData(
          artist: 'nolan',
          entity: 'album,movieArtist,ebook,movie,musicVideo,podcast,song')
      .then((onValue) {
    //Grouping the response
    final groupedResult = <ITunesGroupedModel>[];
    Map<String, List<Results>> groupedItems =
        groupBy(onValue.results ?? [], (Results item) => item.kind ?? '');
    groupedItems.forEach((kind, items) {
      groupedResult.add(ITunesGroupedModel(title: kind, data: items));
    });

    return groupedResult;
  });
});
