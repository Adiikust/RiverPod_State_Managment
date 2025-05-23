import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/app/view/future_provider_post_view.dart';
import 'package:riverpod_project/app/view/simple_provider_view.dart';
import 'package:riverpod_project/app/view/stream_provider_post_view.dart';
import 'app/view/future_provider_view.dart';
import 'app/view/state_notifier_provider_view.dart';
import 'app/view/state_provider_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'RiverPod',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const SimpleProviderView(),
        // home: const StateProviderView(),
        // home: const StateNotifierProviderView(),
        // home: const FutureProviderView(),
        // home: const FutureProviderPostView(),
        home: const StreamProviderPostView(),
      ),
    );
  }
}
