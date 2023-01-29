import 'package:smart_group/data/models/country_model/countries_model.dart';

abstract class CountriesState {}

class CountriesInitial extends CountriesState {}

class CountriesLoadInProgress extends CountriesState {}

class CountriesLoadSuccess extends CountriesState {
  CountriesLoadSuccess({required this.countries});

  final List<CountryModel> countries;
}

class CountriesLoadFailure extends CountriesState {
  final String error;
  CountriesLoadFailure({required this.error});
}

class CountriesFromCache extends CountriesState {
  CountriesFromCache({required this.countries});

  final List<CountryModel> countries;
}