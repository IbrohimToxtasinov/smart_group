import 'package:dio/dio.dart';
import 'package:smart_group/data/api/service/api_client.dart';
import 'package:smart_group/data/models/country_model/countries_model.dart';
import 'package:smart_group/data/models/my_response/my_response.dart';

class CountriesApiSerice extends ApiClient {
  Future<MyResponse> getCountriesList() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/countries");

      if (response.statusCode == 200) {
        myResponse.data = (response.data["data"]["countries"] as List)
            .map((e) => CountryModel.fromJson((e as Map<String, dynamic>)))
            .toList();
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }
}