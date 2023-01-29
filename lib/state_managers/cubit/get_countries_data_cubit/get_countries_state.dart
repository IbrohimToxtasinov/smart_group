import 'package:smart_group/data/api/models/countries_model.dart';

abstract class GetCountriesState {}

class GetCountriesInitial extends GetCountriesState {}

class GetCountriesInLoading extends GetCountriesState {}

class GetCountriesInSucces extends GetCountriesState {
  GetCountriesInSucces({required this.model});
  final List<CountryModel> model;
}

class GetCountriesInFailure extends GetCountriesState {
  GetCountriesInFailure({required this.error});
  final String error;
}
