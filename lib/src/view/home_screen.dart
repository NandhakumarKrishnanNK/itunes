import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itunes/src/widget/text_widget.dart';

import '../app/utils/string_resources.dart';
import '../widget/primary_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    padding: const EdgeInsets.all(6),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.teal[800]),
                    child: const TextWidget(
                      text: "Select iTunes category.",
                      textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
                PrimaryButton(
                  text: StringResource.submit,
                  width: double.infinity,
                  onTap: () {},
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
