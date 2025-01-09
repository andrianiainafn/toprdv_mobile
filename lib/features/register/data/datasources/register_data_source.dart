import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_template_project/features/register/data/models/register_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class RegisterRemoteDataSource{
  Future<bool> registerUser(RegisterModel model);
}
class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;

  RegisterRemoteDataSourceImpl(this.client,this.sharedPreferences);
  @override
  Future<bool> registerUser(RegisterModel model) async {
    final Uri url = Uri.parse('${dotenv.env['BASE_URL']}/appointment/registration');
    final String? token = sharedPreferences.getString('access_token');
    final response = await client.post(
        url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(model.toJson())
    );
    print("status: ${response.statusCode}");
    if(response.statusCode == 201){
      return true;
    }else{
      throw Exception('failed to register user');
    }
  }

}