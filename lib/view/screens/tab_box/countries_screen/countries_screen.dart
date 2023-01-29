import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_group/data/api/service/api_service.dart';
import 'package:smart_group/data/repositories/countries_repository.dart';
import 'package:smart_group/state_managers/bloc/countries/countires_event.dart';
import 'package:smart_group/state_managers/bloc/countries/countries_bloc.dart';
import 'package:smart_group/state_managers/bloc/countries/countries_state.dart';
import 'package:smart_group/view/screens/countries_detail/country_detail_screen.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesBloc(
        CountriesRepository(apiService: CountriesApiSerice()),
      )..add(GetCountries()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("All Countries"),
        ),
        body: BlocConsumer<CountriesBloc, CountriesState>(
          builder: (context, state) {
            if (state is CountriesLoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CountriesLoadFailure) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is CountriesLoadSuccess) {
              return Card(
                child: ListView(
                  children: List.generate(state.countries.length, (index) {
                    return ListTile(
                      subtitle: Text(state.countries[index].capital),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CountryDetailScreen(
                                countryModel: state.countries[index]),
                          )),
                      title: Text(
                        state.countries[index].name,
                      ),
                    );
                  }),
                ),
              );
            } else if (state is CountriesFromCache) {
              return ListView(
                children: List.generate(state.countries.length, (index) {
                  return Card(
                    child: ListTile(
                      subtitle: Text(state.countries[index].capital),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CountryDetailScreen(
                                countryModel: state.countries[index]),
                          )),
                      title: Text(state.countries[index].name),
                    ),
                  );
                }),
              );
            }
            return const SizedBox();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
