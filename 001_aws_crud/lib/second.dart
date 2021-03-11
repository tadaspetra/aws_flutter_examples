import 'package:flutter/material.dart';
import 'package:flutter_basics_firebase/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> create() async {}
    Future<void> read() async {}
    Future<void> update() async {}
    Future<void> delete() async {}

    return Scaffold(
      body: Center(child: Consumer(
        builder: (context, watch, child) {
          final appState = watch(appStateController.state);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(appState.name ?? "no name"),
              Text(appState.age?.toString() ?? "no age"),
              ElevatedButton(
                onPressed: create,
                child: Text("Create"),
              ),
              ElevatedButton(
                onPressed: read,
                child: Text("Read"),
              ),
              ElevatedButton(
                onPressed: update,
                child: Text("Update"),
              ),
              ElevatedButton(
                onPressed: delete,
                child: Text("Delete"),
              ),
            ],
          );
        },
      )),
    );
  }
}
