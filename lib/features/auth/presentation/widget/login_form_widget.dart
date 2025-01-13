import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template_project/core/global/input_password.dart';
import 'package:my_template_project/core/routes/app_router.gr.dart';
import 'package:my_template_project/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_template_project/features/auth/presentation/bloc/token_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import '../../../../core/global/action_button.dart';
import '../../../../core/global/input_widget.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late String token='';
  final Map<String, dynamic> _formData = {
    'email': 'test@gmail.com',
    'password': 'securePassword123',
  };

  final TextEditingController _emailController =
  TextEditingController(text: 'test@example.com');
  final TextEditingController _passwordController =
  TextEditingController(text: 'securePassword123');

  bool _isAuthLoaded = false;

  void _onInputChanged(String key, dynamic value) {
    setState(() {
      if (value is DateTime) {
        _formData[key] = value.toIso8601String();
      } else {
        _formData[key] = value;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeToken();
  }

  Future<void> _initializeToken() async {
    final pushToken = await getToken();
    token = pushToken!;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Loaded) {
              setState(() => _isAuthLoaded = true);
              if(token != ''){
                BlocProvider.of<TokenBloc>(context).add(RegisterTokenEvent(token));
              }
            }
            if (state is ErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
        ),
        BlocListener<TokenBloc, TokenState>(
          listener: (context, state) {
            if (state is TokenLoaded && _isAuthLoaded) {
              context.router.replaceNamed("/");
            }
            if (state is TokenError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                InputWidget(
                  icon: Icons.alternate_email_outlined,
                  type: 'email',
                  title: 'Email Address',
                  controller: _emailController,
                  onChanged: (value) => _onInputChanged('email', value),
                ),
                PasswordInputField(
                  onChanged: (value) => _onInputChanged('password', value),
                  title: "Mot de passe",
                  controller: _passwordController,
                ),
                ActionButton(
                  onSubmitForm: onSubmit,
                  title: 'Se connecter',
                  isLoading: state is Loading,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      const Text(
                        "Pas encore inscrit ?",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          context.navigateTo(SignUpRoute());
                        },
                        child: const Text(
                          'Créer un compte',
                          style: TextStyle(color: Colors.green, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void onSubmit() {
    print('Submit value: $_formData');
    BlocProvider.of<AuthBloc>(context).add(
      Login(_formData['email'], _formData['password']),
    );
  }
}
Future<String?> getToken()async{
  print('optedIn: ${OneSignal.User.pushSubscription.optedIn}');
  print('id ${OneSignal.User.pushSubscription.id}');
  print('token: ${OneSignal.User.pushSubscription.token}');
  return OneSignal.User.pushSubscription.id;
}
