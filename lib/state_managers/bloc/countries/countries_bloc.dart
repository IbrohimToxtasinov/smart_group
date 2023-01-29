import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_group/data/models/country_model/countries_model.dart';
import 'package:smart_group/data/models/my_response/my_response.dart';
import 'package:smart_group/data/repositories/countries_repository.dart';
import 'package:smart_group/state_managers/bloc/countries/countires_event.dart';
import 'package:smart_group/state_managers/bloc/countries/countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc(this.countriesRepository) : super((CountriesInitial())) {
    on<GetCountries>(_fetchCountries);
  }

  final CountriesRepository countriesRepository;

  _fetchCountries(GetCountries event, Emitter<CountriesState> emit) async {
    emit(CountriesLoadInProgress());

    MyResponse myResponse = await countriesRepository.getCountries();

    if (myResponse.error.isEmpty) {
      List<CountryModel> countries = myResponse.data as List<CountryModel>;
      emit(CountriesLoadSuccess(countries: countries));
      await _updateCachedCountries(countries);
    } else {

      print("ERROR USERS: ${myResponse.error}");
      List<CountryModel> countries =
      await countriesRepository.getAllCachedCountries();
      print(countries);
      if (countries.isNotEmpty) {
        emit(CountriesFromCache(countries: countries));
      } else {
        emit(CountriesLoadFailure(error: myResponse.error));
      }
    }
  }

  _updateCachedCountries(List<CountryModel> countries) async {
    int deletedCount = await countriesRepository.deleteCachedCountries();
    print("O'CHIRILGANLAR SONI:$deletedCount");
    for (var country in countries) {
      await countriesRepository.insertCountryToDb(country);
    }
  }
}