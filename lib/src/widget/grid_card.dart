import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itunes/src/app/router.dart';
import 'package:itunes/src/widget/text_widget.dart';

import '../app/utils/string_resources.dart';
import '../model/itunes_model.dart';
import 'shimmer_widget.dart';

class GridCardView extends StatelessWidget {
  const GridCardView({super.key, required this.data});
  final Results data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push<bool>(AppRoutes.detailScreen, extra: data);
      },
      child: Container(
        width: 160,
        decoration: BoxDecoration(
            // color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(4.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              height: 135.0,
              fit: BoxFit.fill,
              width: 125,
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
              height: 2.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      Flexible(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
