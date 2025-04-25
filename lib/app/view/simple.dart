import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/app/view_model/simple_view_model.dart';

class Simple extends StatelessWidget {
  const Simple({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Consumer(
            builder: (context, ref, child) {
              final data = ref.watch(SimpleViewModel.getString);
              return Text(data);
            },
          ),
        ),
      ),
    );
  }
}
