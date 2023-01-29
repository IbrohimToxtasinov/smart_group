import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_group/data/api/models/countries_model.dart';
import 'package:smart_group/data/api/models/my_response/my_response.dart';
import 'package:smart_group/data/repositories/countries_repository.dart';

part 'countires_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc(this.repository) : super(CountriesInitial()) {
    on<GetData>(_fetchCountriesData);
  }
  final CountriesRepository repository;

  _fetchCountriesData(GetData event, Emitter<CountriesState> emit) async {
    emit(CountriesInLoading());

    MyResponse myResponse = await repository.getCountriesData();
    if (myResponse.error.isEmpty) {
      List<CountryModel> countries = myResponse.data as List<CountryModel>;
      emit(CountriesLoadInSuccess(model: countries));
      await _updateCachedCountries(countries);
    } else {
      List<CountryModel> countries = await repository.getAllCachedCountries();
      if (countries.isNotEmpty) {
        emit(
          CountriesFromCache(model: countries),
        );
      } else {
        emit(
          CountriesLoadInFailure(errorText: myResponse.error),
        );
      }
    }
  }

  _updateCachedCountries(List<CountryModel> model) async {
    int count = await repository.deleteCachedUsers();
    debugPrint("nimadir$count");
    for (var model in model) {
      await repository.insertUserToDb(model);
      print("Tushdi");
    }
  }
}
