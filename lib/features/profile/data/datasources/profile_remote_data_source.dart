
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_template_project/features/profile/data/models/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfileModel(int userId);
}
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;

  const ProfileRemoteDataSourceImpl(this.client, this.sharedPreferences);

  @override
  Future<ProfileModel> getProfileModel(int userId) async{
    final userId =  sharedPreferences.getString('appUserId');
    final Uri url = Uri.parse('${dotenv.env['BASE_URL']}/app-users/profile/$userId');
    final token = sharedPreferences.getString('access_token');
    print('${dotenv.env['BASE_URL']}/app-users/profile/$userId');
    print('token: $token');
    final response = await client.get(url,headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });
    if(response.statusCode == 200){
      print('response: ${response.body}');
      return ProfileModel.fromJson(jsonDecode(response.body));
    }else{
      print(response.statusCode);
      throw Exception('Failed to get profile');
    }
  }

}