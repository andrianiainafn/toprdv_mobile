import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template_project/features/brand/presentation/bloc/brand_bloc.dart';
import 'package:my_template_project/features/ibeacon_scanner/presentation/bloc/appointment_bloc.dart';
import 'package:my_template_project/features/ibeacon_scanner/presentation/widgets/appointment_form.dart';

import '../../../../injection_container.dart';

@RoutePage()
class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: buildBody(context),
      ),
      appBar: AppBar(title: Text("Rendez-vous"),),
    );
  }
}

MultiBlocProvider buildBody(BuildContext context) {
  return MultiBlocProvider(providers: [
    BlocProvider(create: (context)=>sl<AppointmentBloc>()),
    BlocProvider(create: (context)=> sl<BrandBloc>())
  ], child: AppointmentForm());
}
