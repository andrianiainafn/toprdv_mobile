import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:my_template_project/features/ibeacon_scanner/data/models/transmitter_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../auth/presentation/widget/login_form_widget.dart';

abstract class ScannerRemoteDatasource {
  Future<List<TransmitterModel>> getTransmitter();
  Future<bool> sendNotification( String beaconId);
  Future<bool> createAppointment(int brandId,DateTime date);
}

class ScannerRemoteDataSourceImpl implements ScannerRemoteDatasource {
  final http.Client client;
  final SharedPreferences sharedPreferences;
  ScannerRemoteDataSourceImpl(this.client,this.sharedPreferences);
  @override
  Future<List<TransmitterModel>> getTransmitter() async{
    final url = Uri.parse('${dotenv.env['BASE_URL']}/transmitter');
    final String? token = sharedPreferences.getString('access_token');
    final response = await client.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if(response.statusCode == 200){
      print('response : ${response.body}');
      final Map<String, dynamic> jsonData = json.decode(response.body);
      List<dynamic> content = jsonData['content'];
      return content.map((brand) => TransmitterModel.fromJson(brand)).toList();
    }else{
      throw Exception('Failed to load transmitter');
    }
  }

  @override
  Future<bool> sendNotification(String beaconId) async{
    final pushToken = await getToken();
    final url = Uri.parse('https://api.onesignal.com/notifications');
    final Map<String, dynamic> additionalData = {"page_type": "beacon", "page_id": beaconId};
    final response = await client.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Key os_v2_app_tcs6djrf6rgzrcmvnhnre6bhd2f4gx6kh2du4mumpsv7hzyoqvqhhxasl2cs7ybsgwkkuxjr4drhuioxxamgbkgysnye3cknd24kgxa",
      },
      body: jsonEncode({
        "app_id": "98a5e1a6-25f4-4d98-8995-69db1278271e",
        "target_channel": "push",
        "contents": {
          "en": "Would you like to schedule an appointment?",
          "fr": "Voulez-vous prendre un rendez-vous ?",
          "es": "Spanish Message"
        },
        "included_segments": ["Subscribed Users"],
        "include_player_ids": [pushToken],
        "data": additionalData
      }),
    );
    if(response.statusCode == 200){
      return true;
    }else{
      throw Exception("Failed to send notification");
    }
  }

  @override
  Future<bool> createAppointment(int brandId,DateTime date) async{
    final userId =  sharedPreferences.getString('appUserId');
    final url = Uri.parse('${dotenv.env['BASE_URL']}/appointment/notification/$userId');
    final String? token = sharedPreferences.getString('access_token');
    final response = await client.post(
        url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "appointmentId":0,
        "brandId":brandId,
        "date": date.toIso8601String(),
      })
    );
    if(response.statusCode == 201){
      return true;
    }else{
      throw Exception("Failed to create appointment");
    }
  }

}