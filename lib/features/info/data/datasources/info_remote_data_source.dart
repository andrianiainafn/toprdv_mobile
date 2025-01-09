import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_template_project/features/info/data/models/info_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class InfoRemoteDataSource{
  Future<InfoModel> fetchInfo(int userid,int pageNumber);
}

class InfoRemoteDataSourceImpl extends InfoRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;
  InfoRemoteDataSourceImpl(this.client, this.sharedPreferences);

  @override
  Future<InfoModel> fetchInfo(int userid, int pageNumber) async{
    final userId =  sharedPreferences.getString('appUserId');
    final url =  Uri.parse('${dotenv.env['BASE_URL']}/info?user-id=$userId&pageNumber=$pageNumber');
    final String? token = sharedPreferences.getString('access_token');
    final response = await client.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
    );
    if(response.statusCode == 200){
        return InfoModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to fetch info');
    }
  }

}