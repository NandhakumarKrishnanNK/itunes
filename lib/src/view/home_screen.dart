import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes/src/app/utils/app_utils.dart';
import 'package:itunes/src/app/utils/constants.dart';
import 'package:itunes/src/view/itunes_screen.dart';
import 'package:itunes/src/view/media_screen.dart';
import 'package:itunes/src/widget/text_widget.dart';

import '../app/utils/string_resources.dart';
import '../viewmodel/media_viewmodel.dart';
import '../widget/primary_button.dart';

class HomeScreen extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final selectedItems = ref.watch(selectedItemsProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextWidget(
                  text: StringResource.itunes,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 28,
                ),
                TextWidget(
                  text: "Search iTunes collection based on the Artist name.",
                  textStyle: TextStyle(
                    color: Colors.grey[50],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                CupertinoSearchTextField(
                  controller: _controller,
                  onChanged: (value) {},
                  onSubmitted: (val) {},
                  suffixMode: OverlayVisibilityMode.never,
                  style: const TextStyle(color: Colors.white),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.teal[800]),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextWidget(
                  text:
                      "Select the iTunes category like song, ebook, movies etc...",
                  textStyle: TextStyle(
                    color: Colors.grey[50],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                PrimaryButton(
                  text: StringResource.selectMediaType,
                  width: double.infinity,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MediaScreen(),
                      ),
                    );
                  },
                  backgroundColor: Colors.transparent,
                  borderColor: Colors.white60,
                  buttonRadius: 6,
                ),
                const SizedBox(
                  height: 18,
                ),
                if (selectedItems.isNotEmpty)
                  Container(
                      height: 80,
                      width: double.infinity,
                      padding: const EdgeInsets.all(6),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.teal[800]),
                      child: Wrap(
                        children: List.generate(
                          selectedItems.length,
                          (index) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.teal[200],
                                borderRadius: BorderRadius.circular(3)),
                            child: TextWidget(
                              text: AppUtils.capitalizeFirstWord(
                                  Constants.mediaType[selectedItems[index]]),
                              textStyle: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )),
                const SizedBox(
                  height: 65,
                ),
                PrimaryButton(
                  text: StringResource.submit,
                  width: double.infinity,
                  onTap: () {
                    var entity = List.generate(
                            selectedItems.length,
                            (index) =>
                                Constants.mediaType[selectedItems[index]])
                        .join(',');
                    // print(entity.toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ITunesScreen(
                            term: _controller.text,
                            entity: selectedItems.isNotEmpty ? entity : ''),
                      ),
                    );
                  },
                  backgroundColor: Colors.teal[200],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
