import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template_project/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_template_project/features/auth/presentation/widget/login_form_widget.dart';

import '../../../../injection_container.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text("Login",style: TextStyle(fontSize: 20),),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: buildBody(context),
          )
        ],
      ),
    );
  }
}

BlocProvider<AuthBloc> buildBody(BuildContext context) {
  return BlocProvider(create: (context)=> sl<AuthBloc>(), child: LoginFormWidget(),);
}