import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_template_project/features/auth/data/models/auth_request_model.dart';
import 'package:my_template_project/features/auth/data/models/auth_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(String email, String password);
  Future<bool> signup(AuthRequestModel model);
  Future<bool> registerPushToken(String token,int appUserId);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;
  const AuthRemoteDataSourceImpl( {required this.client, required this.sharedPreferences,});
  @override
  Future<AuthResponseModel> login(String email, String password) async{
    final url = Uri.parse('${dotenv.env['BASE_URL']}/auth/login');
    final response  = await  client.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
    );
    if(response.statusCode == 200) {
      print(response.body);
      return AuthResponseModel.fromJson(jsonDecode(response.body));
    }else{
      print(response.statusCode);
      throw Exception('Failed to sign in');
    }
  }

  @override
  Future<bool> signup(AuthRequestModel model) async{
    final Uri url = Uri.parse('${dotenv.env['BASE_URL']}/app-users/signup');
    final response = await client.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
        body: jsonEncode(model.toJson())
    );
    if(response.statusCode == 200){
      return true;
    }else{
      throw Exception('failed to signup with this information');
    }
  }

  @override
  Future<bool> registerPushToken(String token, int appUserId) async{
    final Uri url = Uri.parse('${dotenv.env['BASE_URL']}/app-users/save');
    final String? authToken = sharedPreferences.getString('access_token');
    final response  = await  client.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $authToken',
      },
      body: jsonEncode(<String, dynamic>{
        'id': appUserId,
        'token': token,
      }),
    );
    print('code : ${response.statusCode}');
    if(response.statusCode == 200){
      return true;
    }else{
      throw Exception("failed to save token");
    }
  }


}