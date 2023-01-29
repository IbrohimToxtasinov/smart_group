import 'package:dio/dio.dart';
import 'package:smart_group/data/api/models/countries_model.dart';
import 'package:smart_group/data/api/models/my_response/my_response.dart';
import 'package:smart_group/data/api/service/api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getCountriesData() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/countries");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = (response.data['data']['countries'] as List)
            .map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }
}
