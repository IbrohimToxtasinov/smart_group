part of 'single_state_bloc.dart';

class ContactsState extends Equatable {

  final ContactSate status;
  final String statusText;

  ContactsState({
    required this.status,
    required this.statusText
  });


  ContactsState copyWith({
    ContactSate? status,
    String? statusText,
    CardModel? cardModel  }) =>
      ContactsState(
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,

      );

  @override
  List<dynamic> get props => [
    status,
    statusText,
  ];
}

enum ContactSate{
  loading,
  pure,
  contactAdded,
  contactUpdate,
  contactDelete,

}