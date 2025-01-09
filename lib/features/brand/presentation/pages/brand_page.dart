import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template_project/features/brand/presentation/bloc/brand_bloc.dart';
import 'package:my_template_project/features/brand/presentation/bloc/related_users_bloc.dart';
import 'package:my_template_project/features/brand/presentation/widget/brand_form_widget.dart';

import '../../../../injection_container.dart';

@RoutePage()
class BrandPage extends StatelessWidget {
  const BrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Modifer les enseignes a vuivre",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
        buildBody(context)
      ],
    );
  }
}

MultiBlocProvider buildBody(BuildContext context) {
  return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=> sl<BrandBloc>()),
      BlocProvider(create: (context)=> sl<RelatedUsersBloc>())
  ], child: Container(
    margin: EdgeInsets.symmetric(vertical: 0,horizontal: 2),
    child: BrandFormWidget(),
  ));
}
