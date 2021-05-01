import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_template/aws_auth.dart';
import 'package:riverpod_template/providers.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final authAWSRepo = context.read(authAWSRepositoryProvider);
                await authAWSRepo.logOut();
                context.refresh(authUserProvider);
              },
              child: const Text("Sign Out"),
            )
          ],
        ),
      ),
    );
  }
}
