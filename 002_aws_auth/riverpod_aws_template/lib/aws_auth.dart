import 'dart:async';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides methods to interact with Firebase Authentication.
final authAWSRepositoryProvider = Provider<AWSAuthRepository>((ref) => AWSAuthRepository());

class AWSAuthRepository {
  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  Future<String> get user async {
    try {
      final databaseUser = await Amplify.Auth.getCurrentUser();
      return databaseUser.userId;
    } catch (e) {
      print("not signed in");
      return null;
    }
  }

  /// Creates a new user with the provided [email] and [password].
  Future<void> signUp(String email, String password) async {
    try {
      final Map<String, String> userAttributes = {
        'email': email,
        // additional attributes as needed
      };
      final CognitoSignUpOptions options = CognitoSignUpOptions(userAttributes: userAttributes);
      final result = await Amplify.Auth.signUp(username: email, password: password, options: options);
      if (result.isSignUpComplete) {
        //you can do whatever here
      } else {
        throw "Sign In Didn't Work";
      }
    } on Exception {
      rethrow;
    }
  }

  /// Creates a new user with the provided [email] and [password].
  Future<void> confirmSignUp(String email, String confirmationCode) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(username: email, confirmationCode: confirmationCode);

      if (result.isSignUpComplete) {
        //you can do whatever here
      } else {
        throw "Sign In Didn't Work";
      }
    } on Exception {
      rethrow;
    }
  }

  /// Creates a new user with the provided [email] and [password].
  Future<void> signIn(String email, String password) async {
    try {
      final result = await Amplify.Auth.signIn(username: email, password: password);
      if (result.isSignedIn) {
        //you can do whatever here
      } else {
        throw "Sign In Didn't Work";
      }
    } on Exception {
      rethrow;
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  Future<void> logOut() async {
    try {
      await Amplify.Auth.signOut();
    } on Exception {
      rethrow;
    }
  }
}
