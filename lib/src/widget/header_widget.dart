import 'package:flutter/material.dart';
import 'package:itunes/src/app/utils/app_utils.dart';
import 'package:itunes/src/widget/text_widget.dart';

import '../app/utils/string_resources.dart';

// ignore: must_be_immutable
class HeaderWidget extends StatelessWidget {
  HeaderWidget({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          color: Colors.teal[900], borderRadius: BorderRadius.circular(6)),
      child: TextWidget(
        text: text != ''
            ? AppUtils.capitalizeFirstWord(text.replaceAll('-', ' '))
            : StringResource.none,
        textStyle: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
