import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double lineHeight;
  final TextAlign textAlign;
  final GestureTapCallback? onTap;
  final bool isUnderLine;
  final bool isSingleLine;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextDirection? direction;

  const TextWidget({
    super.key,
    required this.text,
    this.textStyle,
    this.lineHeight = 1.5,
    this.textAlign = TextAlign.left,
    this.onTap,
    this.isUnderLine = false,
    this.isSingleLine = false,
    this.maxLines,
    this.direction,
  });

  @override
  Widget build(BuildContext context) {
    final Text textWidget = Text(
      text,
      textAlign: textAlign,
      overflow: isSingleLine ? TextOverflow.ellipsis : null,
      maxLines: maxLines,
      textDirection: direction,
      style: textStyle ??
          Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: lineHeight,
                decoration: isUnderLine
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
      softWrap: true,
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: textWidget,
      );
    } else {
      return textWidget;
    }
  }
}
