import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template_project/core/global/action_button.dart';
import 'package:my_template_project/features/auth/domain/entity/auth_request.dart';
import 'package:my_template_project/features/brand/presentation/bloc/brand_bloc.dart';

import '../../../../core/global/input_password.dart';
import '../../../../core/global/input_widget.dart';
import '../../../../core/global/phone_number_input.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../injection_container.dart';
import '../bloc/auth_bloc.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({super.key});

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'email': '',
    'password': '',
    'firstname':'',
    'lastname':'',
    'city':'',
    'postalCode':'',
    'phoneNumber':''
  };
  void _onInputChanged(String key, dynamic value) {
    setState(() {
      if ( key == 'phoneNumber') {
        _formData[key] = value.phoneNumber ?? '';  // Get the string phone number
      }
      else if (value is DateTime) {
        _formData[key] = value.toIso8601String();
      } else {
        _formData[key] = value;
      }
    });
  }
  void onSubmitForm(){
    print('Submit value: $_formData');
    BlocProvider.of<AuthBloc>(context).add(Signup(AuthRequest(
      _formData['email'],
      _formData['password'],
      _formData['firstname'],
      _formData['lastname'],
      _formData['postalCode'],
      _formData['city'],
      _formData['phoneNumber']
    )),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc,AuthState>(builder: (context,state){
      return Form(
        key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                InputWidget(
                    title: "Nom",
                    type: "text",
                    onChanged: (value)=> _onInputChanged('firstname', value),
                    icon: Icons.person_2_outlined
                ),
                InputWidget(
                    title: "Prénom",
                    type: "text",
                    onChanged: (value)=> _onInputChanged('lastname', value),
                    icon: Icons.person_2_outlined
                ),
                InputWidget(
                  icon: Icons.alternate_email_outlined,
                  type: 'email',
                  title: 'Email Address',
                  onChanged: (value) => _onInputChanged('email', value),
                ),
                PhoneNumberInput(
                    onChanged: (value)=> _onInputChanged('phoneNumber',value,), phoneNumber: null,
                ),
                InputWidget(
                    title: "Code postale",
                    type: "text",
                    onChanged: (value)=> _onInputChanged('postalCode',  value),
                    icon: Icons.location_city_outlined
                ),
                InputWidget(title: "Ville",
                    type: "text",
                    onChanged: (value)=> _onInputChanged('city',value),
                    icon: Icons.location_city_outlined
                ),
                PasswordInputField(
                  onChanged: (value) => _onInputChanged('password', value),
                  title: "Mot de passe",
                ),
                Container(
                    margin: EdgeInsets.only(top: 30),
                    child: ActionButton(onSubmitForm: onSubmitForm, title: "S'inscrire")
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      const Text(
                        "Vous avez deja un compte ?",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          context.navigateTo(LoginRoute());
                        },
                        child: const Text(
                          'Se connecter',
                          style: TextStyle(color: Colors.green, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ],
                  ),
          )
      );
    }, listener: (context,state){
      if (state is Loaded) {
        context.router.replaceNamed("/login");
      }
      if (state is ErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
      }
    });
  }
}
