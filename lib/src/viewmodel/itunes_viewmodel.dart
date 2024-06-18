// import 'package:collection/collection.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:itunes/src/model/itunes_grouped_model.dart';
// import 'package:itunes/src/model/itunes_model.dart';
// import '../services/api_service.dart';

// class ITunesViewModel
//     extends StateNotifier<AsyncValue<List<ITunesGroupedModel>>> {
//   final ApiService apiService;

//   ITunesViewModel(this.apiService) : super(const AsyncValue.data([]));

//   Future<void> fetchItunesData({String? artist, String? entity}) async {
//     try {
//       state = const AsyncValue.loading();

//       await apiService
//           .getiTunesData(
//               artist: 'nolan',
//               entity: 'album,movieArtist,ebook,movie,musicVideo,podcast,song')
//           .then((onValue) {
//         //Grouping the response
//         final groupedResult = <ITunesGroupedModel>[];
//         Map<String, List<Results>> groupedItems =
//             groupBy(onValue.results ?? [], (Results item) => item.kind ?? '');
//         groupedItems.forEach((kind, items) {
//           groupedResult.add(ITunesGroupedModel(title: kind, data: items));
//         });
//         state = AsyncValue.data(groupedResult);
//         return groupedResult;
//       });

//       // await apiService
//       //     .getiTunesData(artist: artist, entity: entity)
//       //     .then((value) {
//       //   state = AsyncValue.data(value.results ?? []);
//       // });

//       // print(response.resultCount);
//     } catch (e) {
//       state = const AsyncValue.data([]);
//     }
//   }
// }

// final apiServiceProvider = Provider((ref) => ApiService());
// final iTunesViewModelProvider = StateNotifierProvider<ITunesViewModel,
//     AsyncValue<List<ITunesGroupedModel>>>(
//   (ref) {
//     final apiService = ref.watch(apiServiceProvider);
//     return ITunesViewModel(apiService);
//   },
// );
