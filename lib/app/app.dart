import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_group/data/repositories/card_repository.dart';
import 'package:smart_group/state_managers/bloc/card_bloc/add_card/add_review_bloc.dart';
import 'package:smart_group/state_managers/bloc/card_bloc/single_state_bloc.dart';
import 'package:smart_group/state_managers/cubit/get_cards/get_cards_cubit.dart';
import 'package:smart_group/view/screens/tab_box/tab_box/tab_box.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) =>
                CardRepository(firebaseFirestore: FirebaseFirestore.instance),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AUDStateBloc(
                cardRepository: context.read<CardRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) => AddCardBloc(
                context.read<CardRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) => CardsCubit(
                context.read<CardRepository>(),
              ),
            ),
          ],
          child: MyApp(),
        ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Group',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
