import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/amplifyconfiguration.dart';
import 'package:riverpod_template/pages/login/login_page.dart';
import 'package:riverpod_template/providers.dart';
import 'pages/home/home.dart';
import 'pages/splash/splash.dart';

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    // Add the following line to add DataStore plugin to your app

    try {
      await Amplify.addPlugins([
        AmplifyAuthCognito(),
      ]);
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException catch (e) {
      print("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
    setState(() {
      _amplifyConfigured = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _amplifyConfigured
          ? Consumer(builder: (context, watch, child) {
              final currentUser = watch(authUserProvider);
              return currentUser.when(data: (data) {
                if (data == null) {
                  return const LoginPage();
                }
                return const HomePage();
              }, loading: () {
                return const SplashPage();
              }, error: (e, st) {
                return const LoginPage();
              });
            })
          : const SplashPage(),
    );
  }
}
