import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:smart_group/data/models/card_model/card_model.dart';
import 'package:smart_group/data/repositories/card_repository.dart';

part 'add_review_event.dart';

part 'add_review_state.dart';

class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  AddCardBloc(this.cardRepository)
      : super(
          const AddCardState(
            status: Status.PURE,
          ),
        ) {
    on<AddCard>(_addCard);
  }

  final CardRepository cardRepository;

  _addCard(AddCard event, Emitter<AddCardState> emit) async {
    emit(state.copyWith(status: Status.LOADING));
    var isAdded = await cardRepository.addCard(cardModel: event.cardModel);
    if (isAdded) {
      emit(state.copyWith(status: Status.SUCCESS));
    } else {
      emit(state.copyWith(status: Status.ERROR));
    }
  }
}
