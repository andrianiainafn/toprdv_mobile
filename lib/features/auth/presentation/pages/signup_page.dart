import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template_project/features/auth/presentation/widget/signup_form_widget.dart';

import '../../../../injection_container.dart';
import '../bloc/auth_bloc.dart';


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
            margin: const EdgeInsets.only(top: 50),
            child: Text("Bienvenue à bord !",style: TextStyle(fontSize: 20),),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: buildBody(context),
            ),
          )
        ],
      ),
    );
  }
}

BlocProvider<AuthBloc> buildBody(BuildContext context) {
  return BlocProvider<AuthBloc>(create: (context)=> sl<AuthBloc>(),child: SignupFormWidget(),);
}