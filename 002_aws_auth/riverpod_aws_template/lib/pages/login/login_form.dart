import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/aws_auth.dart';
import 'package:riverpod_template/providers.dart';

class LoginForm extends StatefulWidget {
  const LoginForm();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: "Email"),
            controller: emailController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: "Password"),
            controller: passwordController,
          ),
          ElevatedButton(
            onPressed: () async {
              final authAWSRepo = context.read(authAWSRepositoryProvider);

              await authAWSRepo.signIn(emailController.text, passwordController.text);
              context.refresh(authUserProvider);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Login"),
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_forward),
                )
              ],
            ),
          ),
          TextButton(
            onPressed: () async {
              final authAWSRepo = context.read(authAWSRepositoryProvider);

              await authAWSRepo.signUp(emailController.text, passwordController.text);
              context.refresh(authUserProvider);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Sign Up"),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          TextField(
            decoration: const InputDecoration(hintText: "Confirmation Code"),
            controller: confirmationCodeController,
          ),
          TextButton(
            onPressed: () async {
              final authAWSRepo = context.read(authAWSRepositoryProvider);

              await authAWSRepo.confirmSignUp(emailController.text, confirmationCodeController.text);
              context.refresh(authUserProvider);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Confirm Sign Up"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
