import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itunes/src/app/utils/string_resources.dart';
import 'package:itunes/src/model/itunes_model.dart';
import 'package:itunes/src/view/detail_screen.dart';

import 'shimmer_widget.dart';
import 'text_widget.dart';

class ListCardView extends StatelessWidget {
  const ListCardView({super.key, required this.data});
  final Results data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              data: data,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              width: 80.0,
              height: 100,
              fit: BoxFit.fill,
              imageUrl:
                  data.artworkUrl100 ?? 'http://via.placeholder.com/350x150',
              placeholder: (context, url) => const Center(
                  child: Shimmer(
                width: double.infinity,
                height: double.infinity,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: 14),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: data.trackName ?? '',
                  maxLines: 2,
                  isSingleLine: false,
                  textStyle: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                          color: Colors.amber[200],
                          borderRadius: BorderRadius.circular(3)),
                      child: const TextWidget(
                        text: ' ${StringResource.artist}: ',
                        textStyle: TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: TextWidget(
                        text: ' ${data.artistName ?? ''}',
                        isSingleLine: true,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
