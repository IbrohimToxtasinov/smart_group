import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:smart_group/utils/color.dart';
import 'package:smart_group/view/screens/add_screen/widget/card_info.dart';

class MyFormField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final TextInputAction textInputAction;

  const MyFormField({
    Key? key,
    required this.controller,
    required this.title, required this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(title),
          ),
          const SizedBox(height: 7),
          TextFormField(
            inputFormatters: title == "Karta raqami"
                ? [
              CreditCardFormatter(),
                    LengthLimitingTextInputFormatter(19)
            ]
                : title == "Amal qilish muddati"?[
              CardExpirationFormatter(),
              LengthLimitingTextInputFormatter(5)
            ]:[


            ],
            onChanged: (s) {
              if (title == "Karta raqami") {
                CardInfo.numberValue.value = s;
              } else if (title == "Amal qilish muddati") {
                CardInfo.dateValue.value = s;
              } else if (title == "Karta nomi") {
                CardInfo.nameValue.value = s;
              } else if (title == "Karta egasining to'liq ism sharifi") {
                CardInfo.ownerValue.value = s;
              }
            },
            textInputAction: textInputAction,
            controller: controller,
            decoration: InputDecoration(
              hintText: title,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: MyColors.othersDark4)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: MyColors.othersDark4)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: MyColors.othersDark4)),
            ),
          ),
        ],
      ),
    );
  }
}

class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != '/') valueToReturn += newValueString[i];
      var nonZeroIndex = i + 1;
      final contains = valueToReturn.contains(RegExp(r'\/'));
      if (nonZeroIndex % 2 == 0 &&
          nonZeroIndex != newValueString.length &&
          !(contains)) {
        valueToReturn += '/';
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}
