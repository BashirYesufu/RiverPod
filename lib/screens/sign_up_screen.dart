import 'package:flutter/material.dart';
import 'package:river_pod/components/riverpod_button.dart';
import 'package:river_pod/components/riverpod_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          RiverPodTextField(label: 'Email'),
          RiverPodTextField(label: 'Password'),
          RiverPodButton(
            onPressed: (){

            },
          ),
        ],
      )
    );
  }
}
