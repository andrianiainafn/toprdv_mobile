import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:my_template_project/features/signup/presentation/widget/registration_form_widget.dart';

@RoutePage()
class UserRegistrationPage extends StatelessWidget {
  const UserRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text("Inscrire une autre personne",style: TextStyle(fontSize: 20),),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: RegistrationFormWidget(),
          )
        ],
      )
    );
  }
}
