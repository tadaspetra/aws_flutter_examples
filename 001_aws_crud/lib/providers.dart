import 'package:flutter_riverpod/flutter_riverpod.dart';

final appStateController = StateNotifierProvider<AppState>((ref) {
  return AppState(Person());
});

class AppState extends StateNotifier {
  AppState(state) : super(state);

  void setPerson(String name, int age) {
    state = Person(name: name, age: age);
  }
}

class Person {
  final String? name;
  final int? age;

  Person({this.name, this.age});
}
