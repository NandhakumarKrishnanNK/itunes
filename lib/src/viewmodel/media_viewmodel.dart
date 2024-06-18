import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedItemsNotifier extends StateNotifier<List<int>> {
  SelectedItemsNotifier() : super([]);

  void toggleItem(int item) {
    if (state.contains(item)) {
      state = state.where((element) => element != item).toList();
    } else {
      state = [...state, item];
    }
  }
}

final selectedItemsProvider =
    StateNotifierProvider<SelectedItemsNotifier, List<int>>((ref) {
  return SelectedItemsNotifier();
});
