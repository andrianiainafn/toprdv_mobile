import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template_project/features/register/presentation/bloc/register_bloc.dart';
import '../../../../injection_container.dart';
import '../../../brand/presentation/bloc/brand_bloc.dart';
import '../widget/registration_form_widget.dart';


@RoutePage()
class UserRegistrationPage extends StatelessWidget {
  const UserRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text("Inscrire une autre personne",style: TextStyle(fontSize: 20),),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: buildForm(context),
            ),
          )
        ],
      )
    );
  }
}

MultiBlocProvider buildForm(BuildContext context){
  return MultiBlocProvider(providers: [
    BlocProvider<BrandBloc>(create: (context)=> sl<BrandBloc>()),
    BlocProvider<RegisterBloc>(create: (context)=> sl<RegisterBloc>()),
  ], child: RegistrationFormWidget());
}
