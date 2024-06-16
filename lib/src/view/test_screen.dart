import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../widget/core_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initializePlayer();
  }

  Future<void> initializePlayer() async {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        'https://video-ssl.itunes.apple.com/itunes-assets/Video115/v4/f0/92/0c/f0920ce2-8bb7-5e62-b44c-36ce701fe7b1/mzvf_6922739671336234286.640x352.h264lc.U.p.m4v'));
    await Future.wait([
      videoPlayerController.initialize(),
    ]);

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: CoreWidget(
        loadingStatus: false,
        child: Column(
          children: [
            const Center(
              child: Text(
                'Welcome to Home Screen!',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 200,
              width: 350,
              child: Chewie(
                controller: ChewieController(
                  videoPlayerController: videoPlayerController,
                  autoPlay: true,
                  looping: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
