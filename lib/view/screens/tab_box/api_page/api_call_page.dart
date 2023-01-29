import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_group/state_managers/bloc/countries/countries_bloc.dart';

class ApiCallPage extends StatelessWidget {
  const ApiCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Call Page"),
        centerTitle: true,
      ),
      body: BlocConsumer<CountriesBloc, CountriesState>(
          builder: (context, state) {
            if (state is CountriesInitial) {
              return const Center(
                child: Text("Hali Data yo'q"),
              );
            } 
            else if (state is CountriesInLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CountriesLoadInFailure) {
              return Center(
                child: Text(state.errorText),
              );
            } else if (state is CountriesLoadInSuccess) {
              return ListView(
                children: List.generate(
                  state.model.length,
                  (index) => InkWell(
                    child: ListTile(
                      title: Text(state.model[index].name),
                      subtitle: Text(state.model[index].capital),
                      trailing: Text(state.model[index].emoji),
                    ),
                  ),
                ),
              );
            }
            else if (state is CountriesFromCache) {
              return ListView(
                children:  List.generate(
                  state.model.length,
                  (index) => InkWell(
                    child: ListTile(
                      title: Text(state.model[index].name),
                      subtitle: Text(state.model[index].capital),
                       trailing: Text(state.model[index].emoji),
                    ),
                  ),
                ),
              );
            } 
            return const SizedBox();
          },
          listener: (context, state) {}),
    );
  }
}
