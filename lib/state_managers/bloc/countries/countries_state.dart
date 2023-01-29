part of 'countries_bloc.dart';

abstract class CountriesState {}

class CountriesInitial extends CountriesState {}

class CountriesInLoading extends CountriesState {}

class CountriesLoadInSuccess extends CountriesState {
  CountriesLoadInSuccess({required this.model});

  final List<CountryModel> model;
}

class CountriesLoadInFailure extends CountriesState {
  CountriesLoadInFailure({required this.errorText});

  final String errorText;
}

class CountriesFromCache extends CountriesState {
  CountriesFromCache({required this.model});

  final List<CountryModel> model;
}
