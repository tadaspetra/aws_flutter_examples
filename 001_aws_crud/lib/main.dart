import 'package:flutter/material.dart';
import 'package:flutter_basics_firebase/providers.dart';
import 'package:flutter_basics_firebase/second.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) => MyHomePage(),
          "/second": (context) => SecondScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interview"),
      ),
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer(
                builder: (context, watch, child) {
                  final appState = watch(appStateController.state);

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(appState.name ?? "no name"),
                      Text(appState.age?.toString() ?? "no age"),
                    ],
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                controller: nameController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Age"),
                controller: ageController,
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: () {
                  if (nameController.text == "") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Name can't be empty"),
                      duration: Duration(seconds: 2),
                    ));
                  } else if (ageController.text == "") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Age can't be empty"),
                      duration: Duration(seconds: 2),
                    ));
                  } else {
                    context.read(appStateController).setPerson(nameController.text, int.parse(ageController.text));
                  }
                },
                child: Text("Update"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/second");
                },
                child: Text("Go to next Screen"),
              )
            ],
          ),
        );
      }),
    );
  }
}
