import 'package:flutter/material.dart';
import 'package:smart_group/screen/card_screen/widget/card_info.dart';
import 'package:smart_group/screen/card_screen/widget/my_button.dart';
import 'package:smart_group/screen/card_screen/widget/my_form_field.dart';
import 'package:smart_group/screen/card_screen/widget/on_focus_tap.dart';
import 'package:smart_group/utils/constants.dart';
import 'package:smart_group/utils/style.dart';

import '../../utils/color.dart';
import 'all_cards.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => EditScreenState();
}

class EditScreenState extends State<EditScreen> {
  late TextEditingController cardNumber;
  late TextEditingController cardDate;
  late TextEditingController cardName;
  late TextEditingController cardOwner;
  int clicked = 0;

  String phoneNumber = "";

  @override
  void initState() {
    cardName = TextEditingController();
    cardOwner = TextEditingController();

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
                      "0000 0000 0000 0000",
                      style: MyTextStyle.sfProMedium
                          .copyWith(color: MyColors.white, fontSize: 23),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "11/23",
                      style: MyTextStyle.sfProMedium
                          .copyWith(color: MyColors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      "Karta nomi",
                      style: MyTextStyle.sfProMedium
                          .copyWith(color: MyColors.white, fontSize: 17),
                    ),
                    const Spacer(),
                    Text(
                      "Karta egasi",
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