import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:my_template_project/core/global/action_button.dart';
import 'package:my_template_project/core/global/date_time_input.dart';
import 'package:my_template_project/core/global/input_select_widget.dart';
import 'package:my_template_project/core/global/phone_number_input.dart';
import 'package:my_template_project/features/register/domain/entity/register.dart';

import '../../../../core/global/input_widget.dart';
import '../../../brand/presentation/bloc/brand_bloc.dart';
import '../bloc/register_bloc.dart';

class RegistrationFormWidget extends StatefulWidget {
  const RegistrationFormWidget({super.key});

  @override
  State<RegistrationFormWidget> createState() => _RegistrationFormWidgetState();
}

class _RegistrationFormWidgetState extends State<RegistrationFormWidget> {

  final _formKey = GlobalKey<FormState>();
  PhoneNumber? _phoneNumber;
  final Map<String, dynamic> _formData = {
    'email': '',
    'firstname': '',
    'lastname': '',
    'phoneNumber': '',
    'date': DateTime.now()
  };

  void _onInputChanged(String key, dynamic value) {
    setState(() {
      if (value is DateTime) {
        _formData[key] = value.toIso8601String();
      } else {
        _formData[key] = value;
      }
    });
  }

  void onSubmit() {
    print(_formData);
    BlocProvider.of<RegisterBloc>(context).add(RegisterUserEvent(
      Register(
          _formData['email'],
          _formData['firstname'],
          _formData['lastname'],
          _formData['phoneNumber'],
          _formData['brand'],
          _formData['date'],
      )
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if(state is RegisterLoaded){

        }
      },
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputWidget(
                icon: Icons.person_2_outlined,
                type: 'text',
                title: 'Nom',
                onChanged: (value) => _onInputChanged('firstname', value),
              ),
              InputWidget(
                icon: Icons.person_2_outlined,
                type: 'text',
                title: 'Prénom',
                onChanged: (value) => _onInputChanged('lastname', value),
              ),
              InputWidget(
                icon: Icons.alternate_email_outlined,
                type: 'email',
                title: 'Email Address',
                onChanged: (value) => _onInputChanged('email', value),
              ),
              PhoneNumberInput(onChanged: (PhoneNumber number) {
                _phoneNumber = number;
                _onInputChanged('phoneNumber', _phoneNumber?.phoneNumber);
              }, phoneNumber: _phoneNumber),
              DateTimeInput(selectedDateTime: DateTime.now(),
                  onDateTimeChanged: (DateTime? selectedDateTime) {
                    _onInputChanged('date', selectedDateTime);
                  }),
              BlocConsumer<BrandBloc, BrandState>(
                listener: (context, state) {

                },
                builder: (context, state) {
                  if(state is BrandInitial){
                    BlocProvider.of<BrandBloc>(context).add(GetBrandEvent());
                  }
                 if(state is LoadingBrand){
                   return Text("Loading brand");
                 }
                 else if (state is LoadedBrand){
                   return InputSelectWidget(title: "Enseigne", onChanged: (value)=>_onInputChanged('brand', value), options: state.brand, isRequired: true);
                 }
                 else{
                   return Text("Error when Loading brand");
                 }
                },
              ),
              ActionButton(onSubmitForm: onSubmit, title: 'Inscrire')
            ],
          )),
    );
  }
}
