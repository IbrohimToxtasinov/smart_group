import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_group/data/models/card_model/card_model.dart';
import 'package:smart_group/data/repositories/card_repository.dart';

part 'single_state_event.dart';

part 'single_state_state.dart';

class AUDStateBloc extends Bloc<ContactsEvent, ContactsState> {
  AUDStateBloc({required this.cardRepository})
      : super(ContactsState(
            status: ContactSate.pure, statusText: "")) {
    on<AddContact>(_addContact);
    on<UpdateContact>(_updateContact);
    // on<DeleteContact>(_deleteContact);
  }

  CardRepository cardRepository;

  _addContact(AddContact event, Emitter<ContactsState> emit) async {
    emit(state.copyWith(status: ContactSate.loading));
    var newContact = cardRepository.addCard(cardModel: event.contact);
    if (newContact != null) {
      emit(state.copyWith(status: ContactSate.contactAdded));
    }
  }

  _updateContact(UpdateContact event, Emitter<ContactsState> emit) async {
    emit(state.copyWith(status: ContactSate.loading));
    cardRepository.updateCard(cardModel: event.userModel);
    emit(state.copyWith(status: ContactSate.contactUpdate));
  }

  // _deleteContact(DeleteContact event, Emitter<ContactsState> emit) async {
  //   emit(state.copyWith(status: ContactSate.loading));
  //   var deleteId = cardRepository.deleteContactById(id: event.contactId);
  //   if (deleteId != -1) {
  //     emit(state.copyWith(status: ContactSate.contactDelete));
  //   }
  // }
}

enum MyStatus {
  ERROR,
  SUCCESS,
  LOADING,
  PURE,
}
