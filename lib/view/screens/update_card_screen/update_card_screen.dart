import 'package:flutter/material.dart';
import 'package:smart_group/data/models/card_model/card_model.dart';
import 'package:smart_group/view/screens/tab_box/cards_screen/cards_screen.dart';
import 'package:smart_group/utils/color.dart';
import 'package:smart_group/utils/constants.dart';
import 'package:smart_group/utils/style.dart';
import 'package:smart_group/view/screens/tab_box/cards_screen/widget/my_button.dart';
import 'package:smart_group/view/screens/tab_box/cards_screen/widget/my_form_field.dart';
import 'package:smart_group/view/screens/tab_box/cards_screen/widget/on_focus_tap.dart';

class UpdateCardScreen extends StatefulWidget {
  const UpdateCardScreen({Key? key, required this.cardModel}) : super(key: key);

  final CardModel cardModel;

  @override
  State<UpdateCardScreen> createState() => UpdateCardScreenState();
}

class UpdateCardScreenState extends State<UpdateCardScreen> {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardDate = TextEditingController();
  TextEditingController cardName = TextEditingController();
  TextEditingController cardOwner = TextEditingController();
  int clicked = 0;

  String phoneNumber = "";

  @override
  void initState() {
    cardName.text = widget.cardModel.cardName;
    cardOwner.text = widget.cardModel.owner;

    super.initState();
  }

  @override
  void dispose() {
    cardName.dispose();
    cardOwner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kartani tahrirlang"),
      ),
      body: OnUnFocusTap(

        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(colors: [
                      Color(hexColor(listOfGradient[clicked].first)),
                      Color(hexColor(listOfGradient[clicked][1])),
                    ])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cardModel.cardNumber,
                      style: MyTextStyle.sfProMedium
                          .copyWith(color: MyColors.white, fontSize: 23),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.cardModel.expireData,
                      style: MyTextStyle.sfProMedium
                          .copyWith(color: MyColors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      widget.cardModel.cardName,
                      style: MyTextStyle.sfProMedium
                          .copyWith(color: MyColors.white, fontSize: 17),
                    ),
                    const Spacer(),
                    Text(
                      widget.cardModel.owner,
                      style: MyTextStyle.sfProMedium
                          .copyWith(color: MyColors.white, fontSize: 19),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    itemCount: listOfGradient.length,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () {
                            clicked = index;
                            setState(() {});
                          },
                          child: Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [
                                Color(hexColor(listOfGradient[index].first)),
                                Color(hexColor(listOfGradient[index][1])),
                              ]),
                            ),
                            child: clicked == index
                                ? const Icon(
                                    Icons.done,
                                    color: MyColors.white,
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 16),
              MyFormField(
                controller: cardName,
                title: 'Karta Nomi', textInputAction: TextInputAction.next,
              ),
              MyFormField(
                controller: cardOwner,
                title: "Karta egasining to'liq ism sharifi", textInputAction: TextInputAction.done,
          ),
        ]),
      ),),
      bottomNavigationBar: MyButton(
        title: "Yangilash",
        onTap: () {},
      ),
    );
  }
}
