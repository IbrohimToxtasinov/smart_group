import 'package:flutter/material.dart';
import 'package:smart_group/screen/card_screen/edit_screen.dart';
import 'package:smart_group/utils/constants.dart';

import '../../utils/color.dart';
import '../../utils/style.dart';
import 'add_card_screen.dart';

class AllCardsScreen extends StatelessWidget {
  const AllCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Text"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddCardScreen()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              height: 180,
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
                    "0000 0000 0000 0000",
                    style: MyTextStyle.sfProMedium
                        .copyWith(color: MyColors.white, fontSize: 23),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "11/23",
                        style: MyTextStyle.sfProMedium
                            .copyWith(color: MyColors.white, fontSize: 20),
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
                    "Karta nomi",
                    style: MyTextStyle.sfProMedium
                        .copyWith(color: MyColors.white, fontSize: 17),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Karta egasi",
                          style: MyTextStyle.sfProMedium
                              .copyWith(color: MyColors.white, fontSize: 19),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const EditScreen()));
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
          }),
    );
  }
}

hexColor(String colorhexcode) {
  String colornew = '0xff$colorhexcode';
  colornew = colornew.replaceAll("#", "");
  int colorint = int.parse(colornew);
  return colorint;
}
