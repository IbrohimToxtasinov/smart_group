import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_group/data/repositories/card_repository.dart';
import 'package:smart_group/state_managers/cubit/get_cards/get_cards_state.dart';

class CardsCubit extends Cubit<CardsState> {
  CardsCubit(
    this.reviewRepository,
  ) : super(InitialCardsState()) {
    _fetchReviewsInfo();
  }

  final CardRepository reviewRepository;

  _fetchReviewsInfo() async {
    emit(LoadCardsInProgress());
    reviewRepository.getCards().listen((reviews) {
      emit(LoadCardsInSuccess(cardModel: reviews));
    });
  }
}
