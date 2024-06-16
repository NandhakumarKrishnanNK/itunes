import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itunes/src/app/utils/string_resources.dart';
import 'package:itunes/src/widget/text_widget.dart';

class CoreWidget extends StatelessWidget {
  const CoreWidget({
    super.key,
    required this.loadingStatus,
    required this.child,
  });

  final bool loadingStatus;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (loadingStatus)
          const Opacity(
            opacity: 0.15,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (loadingStatus)
          Center(
            child: Container(
              height: 40.0,
              width: 120.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 51, 51, 51),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CupertinoActivityIndicator(
                    color: Colors.white,
                    radius: 8,
                  ),
                  TextWidget(
                    text: StringResource.loading,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
