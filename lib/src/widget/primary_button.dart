import 'package:flutter/material.dart';
import 'package:itunes/src/widget/text_widget.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final double buttonElevation;
  final double? buttonRadius;
  final TextAlign textAlign;
  final GestureTapCallback onTap;
  final bool isSingleLine;
  final double height;
  final double? width;
  final int? maxLines;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final Axis axis;
  final MainAxisAlignment alignment;
  final double? fontSize;
  final bool isEnabled;
  final Color? disableColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final MainAxisSize mainAxisSize;

  const PrimaryButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.leadingWidget,
      this.trailingWidget,
      this.textAlign = TextAlign.left,
      this.height = 45,
      this.width,
      this.fontSize,
      this.isSingleLine = false,
      this.buttonElevation = 0.0,
      this.buttonRadius,
      this.axis = Axis.horizontal,
      this.alignment = MainAxisAlignment.center,
      this.maxLines,
      this.isEnabled = true,
      this.disableColor,
      this.backgroundColor,
      this.borderColor,
      this.padding,
      this.mainAxisSize = MainAxisSize.min});

  @override
  PrimaryButtonState createState() => PrimaryButtonState();
}

class PrimaryButtonState extends State<PrimaryButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PrimaryButton oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.isEnabled
            ? () {
                widget.onTap();
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.disableColor ?? widget.backgroundColor,
          padding: widget.padding,
          shape: widget.buttonRadius == null
              ? (Theme.of(context)
                      .elevatedButtonTheme
                      .style
                      ?.shape
                      ?.resolve(<MaterialState>{MaterialState.focused}) ??
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)))
              : RoundedRectangleBorder(
                  side: BorderSide(
                      color: widget.borderColor ??
                          widget.backgroundColor ??
                          Colors.transparent),
                  borderRadius: BorderRadius.circular(widget.buttonRadius!),
                ),
          elevation: widget.buttonElevation,
        ),
        child: Flex(
          direction: widget.axis,
          mainAxisAlignment: widget.alignment,
          mainAxisSize: widget.mainAxisSize,
          children: [
            widget.leadingWidget ?? const SizedBox(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              child: TextWidget(
                  text: widget.text,
                  textAlign: widget.textAlign,
                  maxLines: widget.maxLines,
                  isSingleLine: widget.isSingleLine,
                  textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
            widget.trailingWidget ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
