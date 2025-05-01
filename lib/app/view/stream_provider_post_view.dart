import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/app/view_model/future_post_view_model.dart';

class FutureProviderPostView extends ConsumerWidget {
  const FutureProviderPostView({super.key});
  final url = "https://jsonplaceholder.typicode.com/posts";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Consumer(builder: (context, ref, child) {
          final postData = ref.watch(FuturePostViewModel.getPostData(url));
          return postData.when(
            skipLoadingOnRefresh: false,
            skipLoadingOnReload: false,
            data: (data) => RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(FuturePostViewModel.getPostData(url));
              },
              child: ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final post = data[index];
                    return ListTile(
                      leading: CircleAvatar(child: Text(post.id.toString())),
                      title: Text(post.title.toString(), maxLines: 1),
                      subtitle: Text(post.body.toString()),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10)),
            ),
            error: (error, stackTrace) => Center(
                child: InkWell(
                    onTap: () {
                      ref.refresh(FuturePostViewModel.getPostData(url));
                    },
                    child: Text(error.toString()))),
            loading: () => const Center(child: CircularProgressIndicator()),
          );
        }),
      ),
    );
  }
}
