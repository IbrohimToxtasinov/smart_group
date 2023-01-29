import 'package:smart_group/data/models/card_model/card_model.dart';

abstract class CardsState {}

class InitialCardsState extends CardsState {}

class LoadCardsInProgress extends CardsState {}

class LoadCardsInSuccess extends CardsState {
  LoadCardsInSuccess({required this.cardModel});

  final List<CardModel> cardModel;
}

class LoadCardsInFailure extends CardsState {
  LoadCardsInFailure({required this.error});

  String error;
}