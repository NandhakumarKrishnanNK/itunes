import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itunes/src/app/utils/string_resources.dart';
import 'package:itunes/src/widget/text_widget.dart';

import 'loading_widget.dart';

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
        if (loadingStatus) const LoadingWidget(),
      ],
    );
  }
}
