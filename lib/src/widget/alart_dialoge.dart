import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itunes/src/widget/text_widget.dart';

class DialogWidget {
  static Future<void> showDialog(
      {required BuildContext buildContext,
      required String title,
      required String description,
      required String okBtnText,
      String? otherButton,
      String? cancelBtnText,
      Widget? titleWidget,
      TextStyle? descriptionStyle,
      required Function(String) okBtnFunction}) async {
    await showCupertinoDialog(
      context: buildContext,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: title != ""
            ? TextWidget(
                text: title,
                textAlign: TextAlign.center,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.black, fontSize: 16),
              )
            : titleWidget,
        content: TextWidget(
          text: description,
          textAlign: TextAlign.center,
          textStyle: descriptionStyle ??
              Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Color(0xFF666666), fontSize: 14),
        ),
        actions: <Widget>[
          if (cancelBtnText != null)
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: TextWidget(
                text: cancelBtnText,
                textAlign: TextAlign.center,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: const Color(0xFF0063F7), fontSize: 14),
              ),
            ),
          CupertinoDialogAction(
            child: TextWidget(
              text: okBtnText,
              textAlign: TextAlign.center,
              textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF0063F7),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onPressed: () {
              okBtnFunction(okBtnText);
            },
          ),
          if (otherButton != null)
            CupertinoDialogAction(
              child: TextWidget(
                text: otherButton,
                textAlign: TextAlign.center,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: const Color(0xFF666666), fontSize: 14),
              ),
              onPressed: () {
                okBtnFunction(otherButton);
              },
            ),
        ],
      ),
    );
  }
}
