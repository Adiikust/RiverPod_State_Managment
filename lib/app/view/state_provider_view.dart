import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/app/view_model/simple_view_model.dart';

class StateProvider extends StatelessWidget {
  const StateProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("0",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black,),);
          ],
        )
      ),
    );
  }
}
