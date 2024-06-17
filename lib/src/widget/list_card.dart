import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itunes/src/model/itunes_model.dart';

import '../view/details_screen.dart';
import 'shimmer_widget.dart';
import 'text_widget.dart';

class ListCardView extends StatelessWidget {
  const ListCardView({super.key, required this.data});
  final Results data;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        width: 100.0,
        imageUrl: data.artworkUrl100 ?? 'http://via.placeholder.com/350x150',
        placeholder: (context, url) => const Center(
            child: Shimmer(
          width: double.infinity,
          height: double.infinity,
        )),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      title: TextWidget(
        text: data.trackName ?? '',
        isSingleLine: true,
        textStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
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
    );
  }
}
