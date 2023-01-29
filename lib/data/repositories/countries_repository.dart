import 'package:smart_group/data/api/models/countries_model.dart';
import 'package:smart_group/data/api/models/my_response/my_response.dart';
import 'package:smart_group/data/api/service/api_service.dart';
import 'package:smart_group/data/database/local_database.dart';

class CountriesRepository {
  final ApiService apiService;
  CountriesRepository({required this.apiService});

  Future<MyResponse> getCountriesData() => apiService.getCountriesData();

  Future<CountryModel> insertUserToDb(CountryModel countryModel) =>
      LocalDatabase.insertCountry(countryModel: countryModel);

  Future<List<CountryModel>> getAllCachedCountries() =>
      LocalDatabase.getCachedCountries();

  Future<int> deleteCachedUsers() => LocalDatabase.deleteAll();
}
