
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_template_project/features/brand/data/models/brand_model.dart';
import 'package:http/http.dart' as http;
import 'package:my_template_project/features/brand/data/models/related_brand_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BrandRemoteDataSource{
  Future<List<BrandModel>> getBrand();
  Future<List<RelatedBrandModel>> getRelatedBrand();
  Future<List<RelatedBrandModel>> updateRelatedBrand(List<RelatedBrandModel> relatedBrand);
}

class BrandRemoteDataSourceImpl implements BrandRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;
  BrandRemoteDataSourceImpl(this.client,this.sharedPreferences);

  @override
  Future<List<BrandModel>> getBrand() async{
    final url = Uri.parse('${dotenv.env['BASE_URL']}/brands/options?fieldName=brandName');
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
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((brand) => BrandModel.fromJson(brand)).toList();
    }else{
      throw Exception('Failed to load brand');
    }
  }

  @override
  Future<List<RelatedBrandModel>> getRelatedBrand() async {
    final userId = sharedPreferences.getString('appUserId');
    final url = Uri.parse('${dotenv.env['BASE_URL']}/app-users/profile/$userId');
    final String? token = sharedPreferences.getString('access_token');

    final response = await client.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    print("code ${response.statusCode}");
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      print(' data: $jsonData');

      // Vérifier si relatedUsers existe et le convertir en List
      final relatedUsers = jsonData['relatedUsers'] as List<dynamic>;

      // Convertir chaque élément en RelatedBrandModel
      return relatedUsers
          .map((brand) => RelatedBrandModel.fromJson(brand as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('failed to fetch related brand');
    }
  }

  @override
  Future<List<RelatedBrandModel>> updateRelatedBrand(List<RelatedBrandModel> relatedBrand) async{
    final userId = sharedPreferences.getString('appUserId');
    final url = Uri.parse('${dotenv.env['BASE_URL']}/app-users/related-users/$userId');
    final String? token = sharedPreferences.getString('access_token');
    final Map<String, dynamic> requestBody = {
      'relatedUsersId': relatedBrand.map((brand) => {
        'id': brand.id,
        'value': brand.brandName,
      }).toList(),
    };
    final response = await client.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      body: jsonEncode(requestBody)
    );
    if(response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> relatedUsersData = responseData['relatedUsersId'];

      return relatedUsersData.map((userData) => RelatedBrandModel(
        id: userData['id'],
        brandName: userData['value'],
      )).toList();
    }else{
      throw Exception("Failed to  update related brand");
    }
  }



}