import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_model/future_view_model.dart';

class FutureProviderView extends StatelessWidget {
  const FutureProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final userAsync = ref.watch(FutureViewModel.getProfileData(1));
        return userAsync.when(
          data: (user) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${user.name}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 8),
                Text('Email: ${user.email}',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: ${e.toString()}')),
        );
      }),
    );
  }
}
