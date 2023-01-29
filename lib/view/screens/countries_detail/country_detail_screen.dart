import 'package:flutter/material.dart';
import 'package:smart_group/data/models/country_model/countries_model.dart';

class CountryDetailScreen extends StatelessWidget {
  CountryModel countryModel;

  CountryDetailScreen({super.key, required this.countryModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Country Detail Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Country Name : ${countryModel.name}", style: const TextStyle(fontSize: 25)),
            Text(countryModel.emoji, style: const TextStyle(fontSize: 50)),
            Text("Capital ${countryModel.capital}", style: const TextStyle(fontSize: 25)),
            Text("Currency : ${countryModel.currency}", style: const TextStyle(fontSize: 25)),
            Text("Phone code : ${countryModel.phone}", style: const TextStyle(fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
