import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/stream_post_model.dart';

class StreamPostViewModel {
  static final streamDataProvider =
      StreamProvider<List<StreamPostModel>>((ref) {
    final SteamDataService steamDataService = SteamDataService();
    return steamDataService.getStreamServiceData();
  });
}

class SteamDataService {
  int counter = 1;

  Stream<List<StreamPostModel>> getStreamServiceData() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 3));

      List<StreamPostModel> data = List.generate(
        counter,
        (index) => StreamPostModel(id: index + 1, title: 'Post #${index + 1}'),
      );
      counter++;
      yield data;
    }
  }
}
