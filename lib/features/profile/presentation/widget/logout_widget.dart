import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_router.gr.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';


class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc,AuthState>(builder: (context,state){
      return TextButton(onPressed: (){
        BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
      }, child: Text("Se deconnecter",style: TextStyle(fontSize: 16),));
    },
        listener: (context, state) {
          if (state is Loaded) {
            context.router.replaceAll([const LoginRoute()]);
          }
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        }

    );
  }
}
