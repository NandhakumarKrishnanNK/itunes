import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/itunes_grouped_model.dart';
import '../model/itunes_model.dart';
import '../services/api_service.dart';

final iTunesProvider =
    FutureProvider.family<List<ITunesGroupedModel>, ITuneParameter>(
        (ref, params) async {
  return await ApiService()
      .getiTunesData(
    artist: params.term,
    entity: params.entity,
  )
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

class ITuneParameter extends Equatable {
  const ITuneParameter({
    required this.term,
    required this.entity,
  });

  final String term;
  final String entity;

  @override
  List<Object> get props => [term, entity];
}
