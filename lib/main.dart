import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/screens/sign_up_screen.dart';
import 'package:river_pod/models/user.dart';

final userProvider = StateProvider.autoDispose<User>((ref) => User());

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'River Pod',
      debugShowCheckedModeBanner: false,
      home: const SignUpScreen(),
    );
  }
}
