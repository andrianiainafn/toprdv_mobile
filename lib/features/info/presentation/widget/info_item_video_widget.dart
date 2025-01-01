import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/util/format_date.dart';

class InfoItemVideoWidget extends StatefulWidget {
  final String brand;
  final String videoUrl;
  final DateTime date;
  const InfoItemVideoWidget({super.key, required this.brand, required this.videoUrl, required this.date});

  @override
  State<InfoItemVideoWidget> createState() => _InfoItemVideoWidgetState();
}

class _InfoItemVideoWidgetState extends State<InfoItemVideoWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    // Initialize the video controller with your video URL using networkUrl
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    )..initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white.withAlpha(77),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 10,
              offset: Offset(0, 4),
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.brand, style: TextStyle(fontSize: 18,color: Colors.green),),
          SizedBox(height: 10),
          Text( formatDate(widget.date)),
          SizedBox(height: 10),
          _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.center,
              children: [
                VideoPlayer(_controller),
                // Play/Pause button overlay
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPlaying = !_isPlaying;
                      _isPlaying ? _controller.play() : _controller.pause();
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
              : const Center(
            child: CircularProgressIndicator(color: Colors.green,),
          ),
          // Video progress indicator
          VideoProgressIndicator(
            colors: VideoProgressColors(playedColor: Colors.green),
            _controller,
            allowScrubbing: true,
            padding: const EdgeInsets.all(16),
          ),
          // Additional controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                color: Colors.green,
                icon: const Icon(Icons.replay_10),
                onPressed: () {
                  final position = _controller.value.position;
                  final newPosition = position - const Duration(seconds: 10);
                  _controller.seekTo(newPosition);
                },
              ),
              IconButton(
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _isPlaying = !_isPlaying;
                    _isPlaying ? _controller.play() : _controller.pause();
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.forward_10),
                color: Colors.green,
                onPressed: () {
                  final position = _controller.value.position;
                  final newPosition = position + const Duration(seconds: 10);
                  _controller.seekTo(newPosition);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}