// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:itunes/src/model/itunes_model.dart';
// import '../services/api_service.dart';

// class ITunesViewModel extends StateNotifier<AsyncValue<List<Results>>> {
//   final ApiService apiService;

//   ITunesViewModel(this.apiService) : super(const AsyncValue.data([]));

//   Future<void> fetchItunesData({String? artist, required String entity}) async {
//     try {
//       state = const AsyncValue.loading();

//       await apiService
//           .getiTunesData(artist: artist, entity: entity)
//           .then((value) {
//         state = AsyncValue.data(value.results ?? []);
//       });

//       // print(response.resultCount);
//     } catch (e) {
//       state = const AsyncValue.data([]);
//     }
//   }
// }

// final apiServiceProvider = Provider((ref) => ApiService());
// final iTunesViewModelProvider =
//     StateNotifierProvider<ITunesViewModel, AsyncValue<List<Results>>>(
//   (ref) {
//     final apiService = ref.watch(apiServiceProvider);
//     return ITunesViewModel(apiService);
//   },
// );
