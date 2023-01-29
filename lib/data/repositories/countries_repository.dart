import 'package:smart_group/data/api/service/api_service.dart';
import 'package:smart_group/data/database/local_database.dart';
import 'package:smart_group/data/models/country_model/countries_model.dart';
import 'package:smart_group/data/models/my_response/my_response.dart';

class CountriesRepository {
  CountriesRepository({required this.apiService});

  final CountriesApiSerice apiService;

  Future<MyResponse> getCountries() => apiService.getCountriesList();

  Future<CountryModel> insertCountryToDb(CountryModel countryModel) =>
      LocalDatabase.insertToDatabse(countryModel: countryModel);

  Future<List<CountryModel>> getAllCachedCountries() =>
      LocalDatabase.getCachedCountries();

  Future<int> deleteCachedCountries() => LocalDatabase.deleteAll();
}