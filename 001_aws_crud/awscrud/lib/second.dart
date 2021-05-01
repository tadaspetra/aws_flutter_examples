import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
//import 'package:amplify_api/amplify_api.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'providers.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    // Add the following line to add DataStore plugin to your app

    try {
      await Amplify.addPlugins([
        AmplifyDataStore(modelProvider: ModelProvider.instance),
        AmplifyAPI(),
        AmplifyAuthCognito(),
      ]);
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  Future<void> create() async {
    UserModel newUser = UserModel(name: "Tadas", age: 24);
    await Amplify.DataStore.save(newUser);
    context.read(appStateController).setPerson(newUser.name, newUser.age);
  }

  Future<UserModel> read() async {
    try {
      List<UserModel> users = await Amplify.DataStore.query(UserModel.classType);
      print(users);
      return users.first;
    } catch (e) {
      throw ("Failed to Read");
    }
  }

  Future<void> update() async {
    try {
      UserModel user = await read();
      Amplify.DataStore.save(user.copyWith(age: 25));
      context.read(appStateController).setPerson(user.name, 25);
    } catch (e) {
      print("Failed to Read");
    }
  }

  Future<void> delete() async {
    UserModel user = await read();
    Amplify.DataStore.delete(user);
    context.read(appStateController).setPerson(null, null);
  }

  @override
  Widget build(BuildContext context) {
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
