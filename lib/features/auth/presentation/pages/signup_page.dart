import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';


@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text("Signup",style: TextStyle(fontSize: 20),),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(''),
          )
        ],
      ),
    );
  }
}
