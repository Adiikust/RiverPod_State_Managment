import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateProviderViewModel {
  static int value = 0;
  static final counterValue = StateProvider<int>((ref) {
    return value;
  });

  static bool isCheck = false;
  static final switchValue = StateProvider<bool>((ref) {
    return isCheck;
  });
}
