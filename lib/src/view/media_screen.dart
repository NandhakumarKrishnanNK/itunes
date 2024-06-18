import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes/src/app/utils/app_utils.dart';
import 'package:itunes/src/app/utils/constants.dart';

import '../app/utils/string_resources.dart';
import '../viewmodel/media_viewmodel.dart';
import '../widget/text_widget.dart';

class MediaScreen extends ConsumerWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final selectedItems = ref.watch(selectedItemsProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: const TextWidget(
          text: StringResource.media,
          textStyle: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: Constants.mediaType.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: TextWidget(
              text: AppUtils.capitalizeFirstWord(Constants.mediaType[index]),
              textStyle: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            selected: selectedItems.contains(index),
            trailing: selectedItems.contains(index)
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                  )
                : const SizedBox(),
            onTap: () {
              ref.read(selectedItemsProvider.notifier).toggleItem(index);
            },
          );
        },
        separatorBuilder: (constext, i) => const Divider(
          thickness: .5,
        ),
      ),
    );
  }
}
