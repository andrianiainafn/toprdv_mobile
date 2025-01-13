import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:my_template_project/core/global/action_button.dart';
import 'package:my_template_project/core/global/input_widget.dart';
import 'package:my_template_project/core/global/phone_number_input.dart';
import 'package:my_template_project/features/profile/presentation/bloc/profile_bloc.dart';

class ProfileFormWidget extends StatefulWidget {
  final bool isEdit;
  const ProfileFormWidget({super.key, required this.isEdit});

  @override
  State<ProfileFormWidget> createState() => _ProfileFormWidgetState();
}

class _ProfileFormWidgetState extends State<ProfileFormWidget> {
  final _formKey = GlobalKey<FormState>();
  PhoneNumber? currentPhoneNumber;
  final Map<String, TextEditingController> controllers = {};

  final Map<String, dynamic> _formData = {
    'email': '',
    'password': '',
    'firstname':'',
    'lastname':'',
    'postalCode':'',
    'brandName':'',
    'phoneNumber':''
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
  void onSubmitForm(){

  }
  @override
  void initState() {
    super.initState();
    for (var key in _formData.keys) {
      controllers[key] = TextEditingController(text: _formData[key]);
    }
  }
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ProfileBloc,ProfileState>(
    builder: (context,state){
      if(state is ProfileInitial){
        BlocProvider.of<ProfileBloc>(context).add(GetProfile(0));
        return Text("fetch ...");
      }
      else if(state is ProfileLoaded){
        _formData['firstname'] = state.profile.firstName;
        controllers['firstname']?.text = state.profile.firstName;
        _formData['lastname'] = state.profile.lastName;
        controllers['lastname']?.text = state.profile.lastName;
        _formData['email'] = state.profile.email;
        controllers['email']?.text = state.profile.email;
        _formData['postalCode'] = state.profile.postalCode;
        controllers['postalCode']?.text = state.profile.postalCode;
        _formData['city'] = state.profile.city;
        controllers['city']?.text = state.profile.city;
        _formData['brandName'] = state.profile.brandName;
        controllers['brandName']?.text = state.profile.brandName;
        _formData['phoneNumber'] = state.profile.landlinePhone ;
        controllers['phoneNumber']?.text = state.profile.landlinePhone;
        return SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  InputWidget(
                      isReadOnly: widget.isEdit,
                      controller: controllers['firstname'],
                      title: "Nom",
                      type: "text",
                      onChanged: (value)=> _onInputChanged('firstname', value),
                      icon: Icons.person_2_outlined
                  ),
                  InputWidget(
                      isReadOnly: widget.isEdit,
                      controller: controllers['lastname'],
                      title: "Prénom",
                      type: "text",
                      onChanged: (value)=> _onInputChanged('lastname', value),
                      icon: Icons.person_2_outlined
                  ),
                  InputWidget(
                      isReadOnly: widget.isEdit,
                      title: "Email",
                      type: "email",
                      controller: controllers['email'],
                      onChanged: (value)=> _onInputChanged('email', value),
                      icon: Icons.email_outlined
                  ),
                  InputWidget(
                      title: "Code postale",
                      isReadOnly:widget.isEdit,
                      controller: controllers['postalCode'],
                      type: "text",
                      onChanged: (value)=> _onInputChanged('postalCode',  value),
                      icon: Icons.location_city_outlined
                  ),
                  InputWidget(title: "Ville",
                      isReadOnly: widget.isEdit,
                      controller: controllers['city'],
                      type: "text",
                      onChanged: (value)=> _onInputChanged('city',value),
                      icon: Icons.location_city_outlined
                  ),
                  InputWidget(title: "Enseigne",
                      isReadOnly: widget.isEdit,
                      type: "text",
                      controller: controllers['brandName'],
                      onChanged: (value)=> _onInputChanged('brandName',value),
                      icon: Icons.branding_watermark_outlined
                  ),
                  PhoneNumberInput(
                      onChanged: (value)=> _onInputChanged('phoneNumber',value,),
                      isEdit: widget.isEdit,
                      phoneNumber: PhoneNumber(
                          phoneNumber: state.profile.landlinePhone,
                          isoCode: "MG",
                          dialCode: "261"
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: ActionButton(onSubmitForm: onSubmitForm, title: "Sauvegarder", isLoading: state is ProfileLoading,),
                  ),
                ],
              )
          ),
        );
      }else{
        return Text("Error");
      }
    }, listener: (context,state){

    });
  }
  Future<PhoneNumber> getPhoneNumberInfo(String phoneNumber) async {
    try {
      PhoneNumber number = await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber);
      print('ISO Code: ${number.isoCode}');
      print('Dial Code: ${number.dialCode}');
      print('Phone Number: ${number.phoneNumber}');
      return number;
    } catch (e) {
      return PhoneNumber(
          phoneNumber: "0000000",
          isoCode: "MG",  // Code ISO pour Madagascar
          dialCode: "261"
      ); // Sans le +
      }
  }

  @override
  void dispose() {
    controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }
}
