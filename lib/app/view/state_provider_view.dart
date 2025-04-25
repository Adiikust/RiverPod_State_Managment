import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/app/view_model/state_provider_view_model.dart';

class StateProviderView extends ConsumerWidget {
  const StateProviderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("############################");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Counter Section",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Consumer(builder: (context, ref, child) {
              print("counterValue");
              final data = ref.watch(StateProviderViewModel.counterValue);
              return Text(
                data.toString(),
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              );
            }),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(StateProviderViewModel.counterValue.notifier)
                        .state++;
                  },
                  child: const Text(
                    "Increment",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final check = ref.read(StateProviderViewModel.counterValue);
                    if (check > 0) {
                      ref
                          .read(StateProviderViewModel.counterValue.notifier)
                          .state--;
                    }
                  },
                  child: const Text(
                    "Decrement",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
            const Text(
              "Switch Section",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Consumer(builder: (context, ref, child) {
              print("switchValue");
              final value = ref.watch(StateProviderViewModel.switchValue);
              return Switch(
                  inactiveThumbColor: Colors.red,
                  activeColor: Colors.black,
                  value: value,
                  onChanged: (value) {
                    ref
                        .read(StateProviderViewModel.switchValue.notifier)
                        .state = value;
                  });
            })
          ],
        ),
      ),
    );
  }
}
