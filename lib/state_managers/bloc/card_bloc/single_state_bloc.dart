import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_group/data/models/card_model/card_model.dart';
import 'package:smart_group/data/repositories/card_repository.dart';

part 'single_state_event.dart';

part 'single_state_state.dart';

class AUDStateBloc extends Bloc<ContactsEvent, CardState> {
  AUDStateBloc({required this.cardRepository})
      : super(CardState(
            status: CardsStete.pure, statusText: "")) {
    on<AddContact>(_addCArd);
    on<UpdateContact>(_updateCard);
    on<DeleteContact>(_deleteCard);
  }

  CardRepository cardRepository;

  _addCArd(AddContact event, Emitter<CardState> emit) async {
    emit(state.copyWith(status: CardsStete.loading));
    var newContact = cardRepository.addCard(cardModel: event.contact);
    if (newContact != null) {
      emit(state.copyWith(status: CardsStete.contactAdded));
    }
  }

  _updateCard(UpdateContact event, Emitter<CardState> emit) async {
    emit(state.copyWith(status: CardsStete.loading));
    cardRepository.updateCard(cardModel: event.userModel);
    emit(state.copyWith(status: CardsStete.contactUpdate));
  }

  _deleteCard(DeleteContact event, Emitter<CardState> emit) async {
    emit(state.copyWith(status: CardsStete.loading));
    var deleteId = cardRepository.deleteCard(doId: event.contactId);
    if (deleteId != "") {
      emit(state.copyWith(status: CardsStete.contactDelete));
    }
  }
}

enum MyStatus {
  ERROR,
  SUCCESS,
  LOADING,
  PURE,
}
