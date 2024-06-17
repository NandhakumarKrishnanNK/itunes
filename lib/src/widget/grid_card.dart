import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itunes/src/widget/text_widget.dart';

import '../model/itunes_model.dart';
import '../view/details_screen.dart';
import 'shimmer_widget.dart';

class GridCardView extends StatelessWidget {
  const GridCardView({super.key, required this.data});
  final Results data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              video: data,
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 125.0,
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
            const SizedBox(
              height: 8.0,
            ),
            TextWidget(
              text: data.trackName ?? '',
              isSingleLine: true,
              textStyle:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
