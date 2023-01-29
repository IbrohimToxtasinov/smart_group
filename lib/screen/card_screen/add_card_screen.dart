import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_group/data/models/card_model/card_model.dart';
import 'package:smart_group/screen/card_screen/widget/card_info.dart';
import 'package:smart_group/screen/card_screen/widget/my_button.dart';
import 'package:smart_group/screen/card_screen/widget/my_form_field.dart';
import 'package:smart_group/screen/card_screen/widget/on_focus_tap.dart';
import 'package:smart_group/state_managers/bloc/card_bloc/single_state_bloc.dart';
import 'package:smart_group/utils/constants.dart';
import 'package:smart_group/utils/style.dart';

import '../../utils/color.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => AddCardScreenState();
}

class AddCardScreenState extends State<AddCardScreen> {
  late TextEditingController cardNumber;
  late TextEditingController cardDate;
  late TextEditingController cardName;
  late TextEditingController cardOwner;
  List<String> listOfType = ["Uzcard", "Humo"];
  String type = 'Uzcard';
  int clicked = 0;

  String phoneNumber = "";

  @override
  void initState() {
    TextEditingController cardNumber = TextEditingController();
    TextEditingController cardDate = TextEditingController();
    TextEditingController cardName = TextEditingController();
    TextEditingController cardOwner = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    cardNumber.dispose();
    cardDate.dispose();
    cardName.dispose();
    cardOwner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Karta qo'shing !"),
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
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(colors: [
                      Color(hexColor(listOfGradient[clicked].first)),
                      Color(hexColor(listOfGradient[clicked][1])),
                    ])),
                child: const CardInfo(),
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
                controller: cardNumber,
                title: 'Karta raqami',
                textInputAction: TextInputAction.next,
              ),
              MyFormField(
                controller: cardDate,
                title: 'Amal qilish muddati',
                textInputAction: TextInputAction.next,
              ),
              MyFormField(
                controller: cardName,
                title: 'Karta nomi',
                textInputAction: TextInputAction.next,
              ),
              MyFormField(
                textInputAction: TextInputAction.done,
                controller: cardOwner,
                title: "Karta egasining to'liq ism sharifi",
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 27, vertical: 7),
                child: Text("Karta turi"),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: MyColors.actionNeutralActive)),
                child: DropdownButton(
                  underline: const SizedBox(),
                  borderRadius: BorderRadius.circular(16),
                  style:
                      MyTextStyle.sfProRegular.copyWith(color: MyColors.black),
                  isExpanded: true,
                  value: type,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() => type = newValue);
                    }
                  },
                  items: listOfType.map((String? items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items ?? ''),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 65,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyButton(
        title: "Qo'shish",
        onTap: () {
          context.read<AUDStateBloc>().add(
                AddContact(
                  contact: CardModel(
                    cardId: "",
                    gradient: [],
                    cardNumber: "cardNumber",
                    moneyAmount: "moneyAmount",
                    owner: "owner",
                    expireData: "expireData",
                    iconImage: "iconImage",
                    userId: "ibrohim",
                    phoneId: "phoneId",
                  ),
                ),
              );
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
