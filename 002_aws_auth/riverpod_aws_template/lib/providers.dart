import 'package:riverpod/riverpod.dart';
import 'package:riverpod_template/aws_auth.dart';

/// User from Firebase Authentication
final authUserProvider = FutureProvider<String>((ref) {
  final authAWSRepo = ref.watch(authAWSRepositoryProvider);
  return authAWSRepo.user.then((value) => value);
});
