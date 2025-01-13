import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class NotificationRemoteDataSource{
  Future<bool> changeRank(int appointmentId);
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;

  NotificationRemoteDataSourceImpl(this.client,this.sharedPreferences);
  @override
  Future<bool> changeRank(int appointmentId) async{
    final String? authToken = sharedPreferences.getString('access_token');
    final Uri uri = Uri.parse('${dotenv.env['BASE_URL']}/appointment/rank/$appointmentId');
    final response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $authToken',
      },
    );
    if(response.statusCode == 200){
      return true;
    }else{
      throw Exception("failed to change rank");
    }
  }

}