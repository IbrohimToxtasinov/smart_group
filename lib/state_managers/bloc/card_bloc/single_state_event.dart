part of 'single_state_bloc.dart';

@immutable
abstract class ContactsEvent {}

class AddContact extends ContactsEvent {
  AddContact({required this.contact});

  final CardModel contact;
}

class UpdateContact extends ContactsEvent {
  UpdateContact({required this.userModel});

  final CardModel userModel;
}

class DeleteContact extends ContactsEvent {
  DeleteContact({required this.contactId});

  final String contactId;
}
