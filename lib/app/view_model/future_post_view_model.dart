import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/app/model/post_model.dart';
import 'package:http/http.dart' as http;

class FuturePostViewModel {
  static final getPostData = FutureProvider.family<List<PostModel>, String>(
    (ref, url) async {
      PostService postService = PostService();
      return await postService.fetchPost(url);
    },
  );
}

class PostService {
  Future<List<PostModel>> fetchPost(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((item) => PostModel.fromJson(item)).toList();
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('No Internet connection.');
    } on TimeoutException {
      throw Exception('Request timed out.');
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }
}

class FetchDataException implements Exception {
  final String message;
  FetchDataException(this.message);

  @override
  String toString() => 'FetchDataException: $message';
}
