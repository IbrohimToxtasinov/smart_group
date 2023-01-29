import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_group/data/api/models/my_response/my_response.dart';
import 'package:smart_group/data/repositories/countries_repository.dart';
import 'package:smart_group/state_managers/cubit/get_countries_data_cubit/get_countries_state.dart';

class CountriesCubit extends Cubit<GetCountriesState> {
  CountriesCubit(this.repository) : super(GetCountriesInitial()) {
    fetchCaountriesData();
  }
  final CountriesRepository repository;

  fetchCaountriesData() async {
    emit(GetCountriesInLoading());
    MyResponse myResponse = await repository.getCountriesData();
    if (myResponse.error.isEmpty) {
      emit(GetCountriesInSucces(model: myResponse.data));
    } else {
      emit(GetCountriesInFailure(error: myResponse.error));
    }
  }
}
