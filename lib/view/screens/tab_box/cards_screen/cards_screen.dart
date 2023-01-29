import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_group/state_managers/bloc/card_bloc/single_state_bloc.dart';
import 'package:smart_group/state_managers/cubit/get_cards/get_cards_cubit.dart';
import 'package:smart_group/state_managers/cubit/get_cards/get_cards_state.dart';
import 'package:smart_group/utils/color.dart';
import 'package:smart_group/utils/constants.dart';
import 'package:smart_group/utils/style.dart';
import 'package:smart_group/view/screens/add_card_screen/add_card_screen.dart';
import 'package:smart_group/view/screens/update_card_screen/update_card_screen.dart';

class AllCardsScreen extends StatelessWidget {
  const AllCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Task"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddCardScreen()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<CardsCubit, CardsState>(
        builder: (context, state) {
          if (state is LoadCardsInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadCardsInSuccess) {
            return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    height: 185,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(colors: [
                          Color(hexColor(listOfGradient[index].first)),
                          Color(hexColor(listOfGradient[index][1])),
                        ])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.cardModel[index].cardNumber,
                          style: MyTextStyle.sfProMedium
                              .copyWith(color: MyColors.white, fontSize: 23),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              state.cardModel[index].expireData,
                              style: MyTextStyle.sfProMedium.copyWith(
                                  color: MyColors.white, fontSize: 20),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 30,
                              width: 55,
                              child: true
                                  ? Image.network(
                                      "https://humocard.uz/bitrix/templates/main/img/card2.png")
                                  : Image.network(
                                      "https://marketing.uz/uploads/articles/1192/article-original.png"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7),
                        Text(
                          state.cardModel[index].cardName,
                          style: MyTextStyle.sfProMedium
                              .copyWith(color: MyColors.white, fontSize: 17),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.cardModel[index].owner,
                                style: MyTextStyle.sfProMedium.copyWith(
                                    color: MyColors.white, fontSize: 19),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => UpdateCardScreen(
                                          cardModel: state.cardModel[index])));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: MyColors.white,
                                  size: 21,
                                )),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                            title: const Text(
                                                "Haqiqatdan ham o'chirmoqchimisiz"),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("Yo'q")),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    context
                                                        .read<AUDStateBloc>()
                                                        .add(
                                                          DeleteContact(
                                                            contactId: state
                                                                .cardModel[
                                                                    index]
                                                                .cardId,
                                                          ),
                                                        );
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("Ha")),
                                            ],
                                          ));
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: MyColors.white,
                                  size: 21,
                                ))
                          ],
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  );
                });
          } else if (state is LoadCardsInFailure) {
            return Center(
              child: Text(state.error),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

hexColor(String colorhexcode) {
  String colornew = '0xff$colorhexcode';
  colornew = colornew.replaceAll("#", "");
  int colorint = int.parse(colornew);
  return colorint;
}
