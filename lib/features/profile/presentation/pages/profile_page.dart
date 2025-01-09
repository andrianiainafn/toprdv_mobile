import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template_project/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:my_template_project/features/profile/presentation/widget/profile_form_widget.dart';
import '../../../../injection_container.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../widget/logout_widget.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _isEdit = false;

  void onPressEdit(){
    setState(() {
      _isEdit = !_isEdit;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 150,
        height: 50,
        child: FloatingActionButton(
          onPressed: onPressEdit,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.green,
          child: Text(
            !_isEdit ? "Modifier" : "Annuler",
            style: TextStyle(fontSize: 19,color: Colors.white),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            buildFormBody(context, _isEdit),
            Container(
              margin: EdgeInsets.only(top:10),
              child: buildBody(context),
            )
          ],
        ),
      ),
    );
  }
}

BlocProvider<AuthBloc> buildBody(BuildContext context){
  return BlocProvider<AuthBloc>(create: (context)=> sl<AuthBloc>(),child: LogoutWidget());
}
BlocProvider<ProfileBloc> buildFormBody(BuildContext context, bool edit){
  return BlocProvider<ProfileBloc>(create: (context)=> sl<ProfileBloc>(),child: ProfileFormWidget(isEdit: edit,));
}

