import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateStyleProvider = StateNotifierProvider<ChangeStyleViewModel, bool>(
  (ref) => ChangeStyleViewModel(),
);

class ChangeStyleViewModel extends StateNotifier<bool> {
  ChangeStyleViewModel() : super(true);

  void changeView() {
    state = !state;
  }
}
