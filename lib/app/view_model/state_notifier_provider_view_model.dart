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

  static bool changeColor = false;
  static double sliderValue = 0.5;

  static final multiSate = StateProvider<MultiState>((ref) {
    return MultiState(slider: sliderValue, color: changeColor);
  });
}

class MultiState {
  final bool color;
  final double slider;

  MultiState({required this.color, required this.slider});

  MultiState copyWith({
    bool? color,
    double? slider,
  }) {
    return MultiState(
        color: color ?? this.color, slider: slider ?? this.slider);
  }
}
