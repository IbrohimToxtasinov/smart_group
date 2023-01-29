import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/style.dart';
class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;
  const MyButton({Key? key, required this.title, required this.onTap,  this.isActive=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: MyColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26,vertical: 12),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 52,
            decoration: BoxDecoration(
                color: isActive? MyColors.primary: MyColors.actionPrimaryDisabled, borderRadius: BorderRadius.circular(16)),
            child: Center(
                child: Text(
                  title,
                  style: MyTextStyle.sfProMedium
                      .copyWith(color: MyColors.white, fontSize: 16),
                )),
          ),
        ),
      ),
    );
  }
}
