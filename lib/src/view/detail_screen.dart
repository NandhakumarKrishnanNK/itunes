import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:itunes/src/app/utils/app_utils.dart';
import 'package:itunes/src/app/utils/string_resources.dart';
import 'package:video_player/video_player.dart';

import '../model/itunes_model.dart';
import '../widget/shimmer_widget.dart';
import '../widget/text_widget.dart';

class DetailScreen extends StatefulWidget {
  final Results data;

  const DetailScreen({
    super.key,
    required this.data,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late VideoPlayerController _controller;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.data.previewUrl ?? ''),
    )..initialize().then((_) {
        chewieController = ChewieController(
          videoPlayerController: _controller,
          autoPlay: true,
          looping: true,
        );
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
          title: TextWidget(
            text: widget.data.trackName ?? StringResource.description,
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: widget.data.previewUrl != null
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: Chewie(
                          controller: ChewieController(
                            videoPlayerController: _controller,
                            autoPlay: true,
                            looping: true,
                          ),
                        ),
                      )
                    : CachedNetworkImage(
                        // width: 80.0,
                        height: 200,
                        fit: BoxFit.contain,
                        imageUrl: widget.data.artworkUrl100 ??
                            'http://via.placeholder.com/350x150',
                        placeholder: (context, url) => const Center(
                            child: Shimmer(
                          width: double.infinity,
                          height: double.infinity,
                        )),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverToBoxAdapter(
              child: Wrap(
                children: [
                  _InfoCard(
                    child: TextWidget(
                      text: widget.data.country ?? 'USA',
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                  if (widget.data.primaryGenreName != null)
                    _InfoCard(
                      child: TextWidget(
                        text: widget.data.primaryGenreName ?? '',
                        textStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                  if (widget.data.averageUserRating != null ||
                      widget.data.contentAdvisoryRating != null)
                    _InfoCard(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.yellow[800],
                          ),
                          const SizedBox(width: 4),
                          TextWidget(
                            text:
                                '${widget.data.averageUserRating ?? widget.data.contentAdvisoryRating ?? ''}',
                            textStyle: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_box_rounded,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: widget.data.trackName ?? '',
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
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
                            text: ' ${widget.data.artistName ?? ''}',
                            isSingleLine: true,
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (widget.data.releaseDate != null)
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 6,
                        ),
                        child: TextWidget(
                          text: AppUtils.formatUtcDate(widget.data.releaseDate),
                          isSingleLine: true,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextWidget(
                      text: StringResource.preview,
                      isSingleLine: true,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.blue[900],
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return DraggableScrollableSheet(
                              expand: false,
                              initialChildSize: 0.8,
                              minChildSize: 0.8,
                              maxChildSize: 0.9,
                              builder: (BuildContext context,
                                  ScrollController scrollController) {
                                return Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        )),
                                    child: Column(
                                      children: [
                                        Stack(
                                          alignment:
                                              AlignmentDirectional.bottomEnd,
                                          children: [
                                            CachedNetworkImage(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  .8,
                                              fit: BoxFit.fill,
                                              imageUrl: widget
                                                      .data.artworkUrl100 ??
                                                  'http://via.placeholder.com/350x150',
                                              placeholder: (context, url) =>
                                                  const Center(
                                                      child: Shimmer(
                                                width: double.infinity,
                                                height: double.infinity,
                                              )),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                            Container(
                                              height: 240,
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              width: double.infinity,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    const SizedBox(height: 6),
                                                    TextWidget(
                                                      text: AppUtils
                                                          .formatUtcDate(widget
                                                              .data
                                                              .releaseDate),
                                                      isSingleLine: true,
                                                      textStyle:
                                                          const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    TextWidget(
                                                      text: widget.data
                                                              .primaryGenreName ??
                                                          '',
                                                      maxLines: 2,
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 6),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10),
                                                      child: Html(
                                                        data: widget.data
                                                                .longDescription ??
                                                            widget.data
                                                                .description ??
                                                            '',
                                                        style: {
                                                          "body": Style(
                                                            color: Colors.white,
                                                            fontSize:
                                                                FontSize(14),
                                                          )
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ));
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: Html(
                  data: widget.data.longDescription ??
                      widget.data.description ??
                      '',
                  style: {
                    "body": Style(
                      color: Colors.grey,
                      fontSize: FontSize(14),
                    )
                  },
                ),
                // TextWidget(
                //   text: widget.data.longDescription ??
                //       widget.data.description ??
                //       '',
                //   textStyle: const TextStyle(
                //     color: Colors.grey,
                //     fontSize: 14,
                //   ),
                // ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final Widget child;

  const _InfoCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Colors.white38,
            blurRadius: 8,
          )
        ],
      ),
      child: child,
    );
  }
}
