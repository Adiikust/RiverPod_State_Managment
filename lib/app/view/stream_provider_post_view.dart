import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/app/view_model/stream_post_view_model.dart';

class StreamProviderPostView extends ConsumerWidget {
  const StreamProviderPostView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Consumer(builder: (context, ref, child) {
          final postData = ref.watch(StreamPostViewModel.streamDataProvider);
          return postData.when(
            skipLoadingOnRefresh: false,
            skipLoadingOnReload: false,
            data: (data) => ListView.separated(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final post = data[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text(post.id.toString())),
                    title: Text(post.title.toString(), maxLines: 1),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10)),
            error: (error, stackTrace) => Center(child: Text(error.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
          );
        }),
      ),
    );
  }
}
