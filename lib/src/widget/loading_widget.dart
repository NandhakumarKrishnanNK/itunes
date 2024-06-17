import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itunes/src/app/utils/string_resources.dart';
import 'package:itunes/src/widget/text_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
