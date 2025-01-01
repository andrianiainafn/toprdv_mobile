import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:my_template_project/core/global/action_button.dart';
import 'package:my_template_project/core/global/date_time_input.dart';
import 'package:my_template_project/core/global/phone_number_input.dart';

import '../../../../core/global/input_widget.dart';

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
    'phoneNumber':'',
    'date':DateTime.now()

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
  void onSubmit(){
    print('Submit value: $_formData');
  }
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child:  Column(
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
        DateTimeInput(selectedDateTime: DateTime.now(),onDateTimeChanged: (DateTime? selectedDateTime){
          _onInputChanged('date', selectedDateTime);
        } ),
        ActionButton(onSubmitForm: onSubmit, title: 'Inscrire')
      ],
    ));
  }
}
