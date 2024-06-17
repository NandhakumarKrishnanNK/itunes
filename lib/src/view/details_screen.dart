import 'package:flutter/material.dart';
import 'package:itunes/src/model/itunes_model.dart';
import 'package:video_player/video_player.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.video});
  final Results video;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.video.previewUrl ?? ''),
    )..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.video.trackName ?? '',
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'By: ${widget.video.artistName ?? 'unknown'}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        widget.video.country ?? 'unknown',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Text(
                            'Price: ${widget.video.currency ?? ''}',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          Text(
                            ' ${widget.video.collectionPrice.toString()}',
                            style: const TextStyle(
                                fontSize: 18.0, color: Colors.green),
                          ),
                        ],
                      ),
                      Center(
                          child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Buy'),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
