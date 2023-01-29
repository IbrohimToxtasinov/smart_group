import 'package:flutter/material.dart';
import 'package:smart_group/utils/color.dart';
import 'package:smart_group/utils/style.dart';

class CardInfo extends StatelessWidget {
  static var numberValue = ValueNotifier(' ');
  static var dateValue = ValueNotifier(' ');
  static var nameValue = ValueNotifier(' ');
  static var ownerValue = ValueNotifier(' ');
  const CardInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder(
            valueListenable: nameValue,
            builder: (BuildContext context, String newValue,
                Widget? child) {
              return Text(
                newValue,
                style: MyTextStyle.sfProMedium
                    .copyWith(color: MyColors.white),
              );
            }),
        const SizedBox(height: 5),
        ValueListenableBuilder(
            valueListenable: numberValue,
            builder: (BuildContext context, String newValue,
                Widget? child) {
              return Text(newValue ,style: MyTextStyle.sfProMedium
                  .copyWith(color: MyColors.white,fontSize: 22),);
            }),
        const SizedBox(height: 5),
        ValueListenableBuilder(
            valueListenable: dateValue,
            builder: (BuildContext context, String newValue,
                Widget? child) {
              return Text(newValue, style: MyTextStyle.sfProMedium
                  .copyWith(color: MyColors.white,fontSize: 16),);
            }),
      ],
    );
  }
}
