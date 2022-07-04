import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/components/riverpod_button.dart';
import 'package:river_pod/components/riverpod_textfield.dart';
import 'package:river_pod/main.dart';
import 'package:river_pod/screens/home_screen.dart';
import '../models/user.dart';


class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod Sign Up'),
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
            RiverPodTextField(
              label: 'Email',
              onChanged: (value) => ref.read(userProvider.notifier).state.email = value
            ),
          RiverPodTextField(
              label: 'Password',
              onChanged: (value) => ref.read(userProvider.notifier).state.password = value
            ),
            RiverPodButton(
            onPressed: (){
              if (user.email.isNotEmpty && user.email.contains('@')){
                if (user.password.length > 5){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                } else {
                  showModalBottomSheet(context: context, builder: (context){
                    return Container(
                      height: 100,
                      color: Colors.blue,
                      child: Center(child: Text('Please Enter a valid password')),
                    );
                  });
                }
              } else {
                showModalBottomSheet(context: context, builder: (context){
                  return Container(
                    height: 100,
                    color: Colors.blue,
                    child: Center(child: Text('Please Enter a valid email')),
                  );
                });
              }
            },
            text: 'Sign Up',
          ),
        ],
      )
    );
  }
}
