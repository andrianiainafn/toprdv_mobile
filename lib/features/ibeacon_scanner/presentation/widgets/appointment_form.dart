import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template_project/features/ibeacon_scanner/presentation/bloc/appointment_bloc.dart';
import '../../../../core/config/ably_service.dart';
import '../../../../core/global/action_button.dart';
import '../../../../core/global/date_time_input.dart';
import '../../../../core/global/input_select_widget.dart';
import '../../../brand/presentation/bloc/brand_bloc.dart';

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({super.key});

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'date': DateTime.now().toIso8601String()
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
    final date = DateTime.parse(_formData['date']);
    BlocProvider.of<AppointmentBloc>(context).add(HandleCreateAppointment(int.parse(_formData['brand']),date));
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentBloc , AppointmentState>(
        builder: (context,state){
      return Form(
          key: _formKey,
          child: Column(
            children: [
            DateTimeInput(selectedDateTime: DateTime.now(),
                  onDateTimeChanged: (DateTime? selectedDateTime) {
                    _onInputChanged('date', selectedDateTime);
                  }),
            BlocConsumer<BrandBloc, BrandState>(
            listener: (brandContext, brandState) {

            },
            builder: (brandContext, brandState) {
              if(brandState is BrandInitial){
                BlocProvider.of<BrandBloc>(context).add(GetBrandEvent());
              }
              if(brandState is LoadingBrand){
                return Text("Loading brand");
              }
              else if (brandState is LoadedBrand){
                return InputSelectWidget(title: "Enseigne", onChanged: (value)=>_onInputChanged('brand', value), options: brandState.brand, isRequired: true);
              }
              else{
                return Text("Error when Loading brand");
              }
            },
            ),
              ActionButton(onSubmitForm: onSubmit, title: 'Confirmer le rendez-vous',isLoading: state is AppointmentLoading,)
            ],
          )
      );
    }, listener: (context,state){
      if(state is AppointmentLoaded){
        final ablyService = AblyService();
        ablyService.initAbly();
        ablyService.publishAppointment({
          'appointment': "appointment",
        });
      }
    });
  }
}
