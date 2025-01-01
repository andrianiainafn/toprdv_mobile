import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_template_project/features/auth/data/models/auth_response_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(String email, String password);
  Future<void> signup(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final http.Client client;
  const AuthRemoteDataSourceImpl({required this.client});
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
  Future<void> signup(String email, String password) {
    // TODO: implement signup
    throw UnimplementedError();
  }

}