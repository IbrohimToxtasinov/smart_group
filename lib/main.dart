import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_group/data/api/service/api_service.dart';
import 'package:smart_group/data/repositories/countries_repository.dart';
import 'package:smart_group/screen/card_screen/all_cards.dart';
import 'package:smart_group/state_managers/bloc/countries/countries_bloc.dart';
import 'package:smart_group/state_managers/cubit/get_countries_data_cubit/get_countries_cubit.dart';
import 'package:smart_group/view/screens/tab_box/api_page/api_call_page.dart';
import 'package:smart_group/screen/card_screen/add_card_screen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (context) =>
            CountriesBloc(CountriesRepository(apiService: ApiService()))..add(GetData())),
    BlocProvider(
        create: (context) =>
            CountriesCubit(CountriesRepository(apiService: ApiService())))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllCardsScreen(),
    );
  }
}
