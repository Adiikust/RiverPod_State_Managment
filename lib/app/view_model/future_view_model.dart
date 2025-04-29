import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimpleViewModel {
  static Provider<String> getString = Provider<String>(
    (ref) {
      return "Simple RiverPod Show Data";
    },
  );
}
