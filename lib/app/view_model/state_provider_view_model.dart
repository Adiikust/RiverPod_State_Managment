import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateProviderViewModel {
  static int value = 0;
  static final counterValue = StateProvider<int>((ref) {
    return value;
  });
}
